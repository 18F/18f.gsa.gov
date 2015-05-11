#!/bin/bash
DOMAIN="18f.gov"
HOST=${HOST-site}
if $(cf app site-a | grep -q started)
then
  OLD="site-a"
  NEW="site-b"
else
  OLD="site-b"
  NEW="site-a"
fi

echo "Pushing new app to $NEW and disabling $OLD"
cf push $NEW
if [[ $? -ne 0 ]]; then
  echo "Error pushing"
  cf stop $NEW
  exit 1
fi

echo "Re-routing"
cf map-route $NEW $DOMAIN -n $HOST
cf unmap-route $OLD $DOMAIN -n $HOST
cf stop $OLD

echo "Done"

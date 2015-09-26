#! /bin/bash
# check if the _site directory was generated
if [ -d "_site" ]
then
  echo "Site directory generated correctly"
else
  echo "Something is wrong with the site";
  CODE=1;
fi
# check if the feed was generated correctly
if [ -s  "_site/feed/index.xml" ]
then
  echo "Feed generated correctly";
else
  echo "Something is wrong with the feed";
  CODE=1;
fi
# check if page files are generated and not empty
if [ -s "_site/index.html" ]
then
  echo "Page files generated correctly";
else
  echo "something is wrong with 'pages'";
  CODE=1;
fi
# check that the blog was generated
if [ -s "_site/blog/index.html" ]
then
  echo "Blog generated correctly";
else
  echo "something is wrong with the blog";
  CODE=1;
fi
# check that a blog pagination is generating and not empty
if [ -s "_site/blog/page/2/index.html" ]
then
  echo "blog pagination generated correctly";
else
  echo "something is wrong with blog pagination";
  CODE=1;
fi
# check that a specific post is generating and not empty
if [ -s "_site/2015/05/12/announcing-the-calc-tool/index.html" ]
then
  echo "Blog posts generated correctly";
else
  echo "Something is wrong with blog posts";
  CODE=1;
fi
# check that the team page is generated and not empty
if [ -s "_site/team/index.html" ]
then
  echo "Team page generated correctly";
else
  echo "Something is wrong with the team page.";
  CODE=1;
fi
if [ "$CODE" = "1" ]
then
  exit 1;
else
  echo "All tests passed!"
  exit 0;
fi

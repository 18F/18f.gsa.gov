#!/bin/bash
_project=$1
_branch=$2
_circle_token=$3
_functional_tests_target=$4
trigger_build_url=https://circleci.com/api/v1/project/${_project}/tree/${_branch}?circle-token=${_circle_token}
post_data=$(cat <<EOF
{
  "build_parameters": {
    "RUN_NIGHTLY_BUILD": "true",
    "FUNCTIONAL_TEST_TARGET": ${_functional_tests_target}
  }
}
EOF)
curl \
--header "Accept: application/json" \
--header "Content-Type: application/json" \
--data "${post_data}" \
--request POST ${trigger_build_url}
Add Comment Collapse

#!/bin/bash

token="perm:YWRtaW4=.NDYtMw==.G02cccRtye6QWEzkOXM1RXcRnASsB2"
base_url="http://192.168.1.138/api"

issue_id=$(curl -H "Accept: application/json" -H "Authorization: Bearer $token" "$base_url/issues?fields=id&query=$CI_COMMIT_BRANCH" | jq -r '.[0].id')

echo "$issue_id"
curl -v -H "Content-Type: application/json" -H "Authorization: Bearer $token" -X POST -d '{ "text": "'"$1"'" }' "$base_url/issues/$issue_id/comments?fields=id,author(login,name,id),deleted,text,updated" | jq

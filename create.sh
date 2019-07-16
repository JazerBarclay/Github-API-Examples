#!/bin/bash

display_usage() {
	echo "Please ensure your username and key is set"
	echo "Usage: $0 project name goes here"
}

username=joebloggs
token=0123456789
projectslocation=~/projects

if [ $# -le 1 ]
then
	display_usage
	exit 1
fi

projectname=$(echo $@ | tr " " -)
#projectname=$(echo $@ | sed -e "s/\b\(.\)/\u\1/g" | tr " " -)
#projectname=$(echo $1 | sed -e "s/\b\(.\)/\u\1/g" | tr " " -)
#projectname=$1
echo "Creating project: $projectname"

curl -X POST \
  https://api.github.com/user/repos \
  -u $username:$token \
  -H 'Content-Type: application/json' \
  -d '{ "name": "'$projectname'", "private": false, "auto_init": true }'
  
pushd $projectslocation && git clone git@github.com:$username/${projectname,,}.git && popd
#!/bin/bash

display_usage() {
	echo "Usage: $0 project name goes here"
}

username=joebloggs
token=`cat $HOME/.keys/git_api_key`
projectslocation=~/projects

if [ $# -lt 1 ]; then
	display_usage
	exit 1
fi

projectname=$(echo $@ | tr " " - | tr '[:upper:]' '[:lower:]')
echo "Pulling project: $projectname from github"

pushd $projectslocation && git clone git@github.com:$username/$projectname.git && popd
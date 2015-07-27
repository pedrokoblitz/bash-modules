#!/bin/bash

readonly GITUSER="pedrokoblitz"
readonly PROJECTS_FOLDER="~/projects/"

download_all() {
	local $REPOS_LIST=$1
	cd $PROJECTS_FOLDER
	
	while read REPO
	do
	    git clone "$REPO"
	done < $REPOS_LIST
}
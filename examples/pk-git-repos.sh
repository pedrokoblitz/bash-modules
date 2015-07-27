#!/bin/bash

readonly GITUSER="pedrokoblitz"
readonly PROJECTS_FOLDER="~/projects/"

usage() {
	cat <<- EOF
		multi line text goes here...
		multi line text goes here...
		multi line text goes here...
	EOF	
}

download_all() {
	local $REPOS_LIST=$1
	cd $PROJECTS_FOLDER
	
	while read REPO
	do
	    git clone "$REPO"
	done < $REPOS_LIST
}
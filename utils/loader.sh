#!/bin/bash

#
# MODULE_PATH="./module/"
# 
# command:
# include_module fs fd
#
# will run commands:
# source ./module/fs.sh
# source ./module/fd.sh

declare MODULE_PATH="../modules"

#
#
#
include_module() {
	local MODULES=$@
	if [[ -z $MODULE_PATH ]]; then
		exit
	fi

	for MODULE in $MODULES
	do
		local FILE=$MODULE_PATH/$MODULE.sh
		if [[ -f $FILE ]]; then
			source $FILE
		fi
	done
}


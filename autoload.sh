#!/bin/bash

#
# MODULE_PATH="./module/"
# 
# command:
# _ fs fd
#
# will run commands:
# source ./module/fs.sh
# source ./module/fd.sh

readonly MODULE_PATH="./module"

_() {
	
	local MODULES=$@

	if [[ -z $MODULE_PATH ]]; then
		
		exit("Global variable MODULE_PATH is not set.")

	fi

	for MODULE in $MODULES
	do
		if [[ type -t $MODULE ]]; then

			local FILE=$MODULE_PATH"/"$MODULE".sh"

			if [[ -f $FILE ]]; then

				source $FILE
			fi
		fi
	done
}


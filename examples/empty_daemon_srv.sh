#!/bin/bash

#
#
#
conf() {
    local BASE='./conf/tresr.conf'
    if [[ -f $BASE ]]; then
    	source $BASE
    fi
}
conf

#
#
#
register() {
	update-rc.d $PROG_NAME defaults
}

#
#
#
remove() {
	update-rc.d -f $PROG_NAME remove
}

#
#
#
start() {
	
}

#
#
#
restart() {
	
}

#
#
#
stop() {
	
}

reload() {
	
}

main() {

	if [[ $1 -eq 'start']]; then
		start
	fi	

	if [[ $1 -eq 'restart']]; then
		restart
	fi	

	if [[ $1 -eq 'stop']]; then
		stop
	fi

	if [[ $1 -eq 'reload']]; then
		reload
	fi	
}
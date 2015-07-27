#!/bin/bash

usage() {
	cat <<- EOF
		multi line text goes here...
		multi line text goes here...
		multi line text goes here...
	EOF	
}

#
#
daemon_is_installed() {

}

#
#
daemon_create_dir() {

}

#
#
daemon_install() {
	if ! [[ daemon_is_installed ]]; then
		daemon_create_dir
		daemon_create_default_conf
		daemon_register
	fi
}

#
#
daemon_create_default_conf() {

}

#
#
daemon_register() {
	local PROG=$1
	update-rc.d $PROG defaults
}

#
#
daemon_unregister() {
	local PROG=$1
	update-rc.d -f $PROG remove
}

#
#
daemon_load_default_conf() {

}

#
#
start() {
	
}

#
#
restart() {
	
}

#
#
stop() {
	
}

#
#
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

main $@

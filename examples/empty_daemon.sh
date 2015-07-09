#!/bin/bash

#
#
#
daemon_is_installed() {

}

#
#
#
daemon_create_dir() {

}

#
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
#
daemon_create_default_conf() {

}

#
#
#
daemon_register() {
	local PROG=$1
	update-rc.d $PROG defaults
}

#
#
#
daemon_unregister() {
	local PROG=$1
	update-rc.d -f $PROG remove
}

#
#
#
daemon_load_default_conf() {

}

#
#
#
daemon_start() {
	
}

#
#
#
daemon_restart() {
	
}

#
#
#
daemon_stop() {
	
}

#
#
#
daemon_reload() {
	
}

#
#
#
main() {

	if [[ $1 -eq 'start']]; then
		daemon_start
	fi	

	if [[ $1 -eq 'restart']]; then
		daemon_restart
	fi	

	if [[ $1 -eq 'stop']]; then
		daemon_stop
	fi	

	if [[ $1 -eq 'reload']]; then
		daemon_reload
	fi	
}
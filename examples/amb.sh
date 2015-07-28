#!/bin/bash

source ./conf/run_as_root.conf
source ./conf/modules.conf

readonly PHP_INI_FILE=/etc/php5/apache2/php.ini
readonly HOSTS_FILE=/etc/hosts
readonly PHP_INI_BAK=$PROG_DIR/php.ini.bak
readonly HOSTS_BAK=$PROG_DIR/hosts.bak

source ./modules/fs/fs.sh
module_fs

source ./modules/installer/installer.sh
module_installer

usage() {
	cat <<- EOF
		multi line text goes here...
		multi line text goes here...
		multi line text goes here...
	EOF	
}


#
#
hosts_to_dev() {
	hosts_backup

	cp $PROG_DIR/hosts.dev $HOSTS_FILE

	if [ fs.is_empty $FILE ]; then
		hosts_restore
	fi
}

#
#
hosts_to_prod() {
	hosts_backup

	cp $PROG_DIR/hosts.prod $HOSTS_FILE

	if [ fs.is_empty $HOSTS_FILE ]; then
		hosts_restore
	fi
}

#
#
php_err_on() {
	php_ini_backup

	sed -i 's/display_errors\ =\ On/display_errors\ =\ Off/g' $PHP_INI_FILE

	if [ fs.is_empty $PHP_INI_FILE ]; then
		php_ini_restore
	fi

	service apache2 restart
}

#
#
php_err_off() {
	php_ini_backup

	sed -i 's/display_errors\ =\ On/display_errors\ =\ Off/g' $PHP_INI_FILE

	if [ fs.is_empty $PHP_INI_FILE ]; then
		php_ini_restore
	fi
	
	service apache2 restart
}

# copia php.ini para pasta do script
#
php_ini_backup() {
	cp $PHP_INI_FILE $PHP_INI_BAK
}

# restaura php.ini
#
php_ini_restore() {
	cp $PHP_INI_BAK $PHP_INI_FILE
}

# copia /etc/hosts para pasta do script
#
hosts_backup() {
	cp $HOSTS_FILE $HOSTS_BAK
}

# restaura /etc/hosts
#
hosts_restore() {
	cp $HOSTS_BAK $HOSTS_FILE
}

# comando: host
#
hosts() {
	local MODO=$1

	if [ "$MODO" == "prod" ]
		then
			hosts_to_prod
	elif [ "$MODO" == "dev" ]
		then
			hosts_to_dev
	fiz
}

# comando: php
#
php() {
	local MODO=$1

	if [ "$MODO" == "erroff" ]
		then
			php_err_off
	elif [ "$MODO" == "erron" ]
		then
			php_err_on
	fi
}

#
#
main() {

	local COMANDO=$1
	local MODO=$2

	$COMANDO $MODO
}


main $1 $2


#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#source ./utils/loader.sh
source ./conf/modules.conf

source ./modules/fs/fs.sh
source ./modules/installer/installer.sh
source ./modules/varcheck/varcheck.sh

#
#
module_amb() {

	#
	#
	amb.hosts_para_dev() {
		amb.hosts_backup

		local FILE=/etc/hosts
		sudo cp /home/pedro/.amb/dev $FILE

		if [ fs.is_empty $FILE ]; then
			amb.hosts_restore
		fi
	}

	#
	#
	amb.hosts_para_prod() {
		amb.hosts_backup

		local FILE=/etc/hosts
		sudo cp /home/pedro/.amb/prod $FILE

		if [ fs.is_empty $FILE ]; then
			amb.hosts_restore
		fi
	}

	#
	#
	amb.php_err_on() {
		amb.php_ini_backup

		local FILE=/etc/php5/apache2/php.ini
		fs.replace_in_file $FILE "display_errors = Off" "display_errors = On"

		if [ fs.is_empty $FILE ]; then
			amb.php_ini_restore
		fi

		service apache2 restart
	}

	#
	#
	amb.php_err_off() {
		amb.php_ini_backup

		local FILE=/etc/php5/apache2/php.ini
		fs.replace_in_file $FILE "display_errors = On" "display_errors = Off"

		if [ fs.is_empty $FILE ]; then
			amb.php_ini_restore
		fi
		
		service apache2 restart
	}

	# copia php.ini para pasta do script
	#
	amb.php_ini_backup() {
		local FILE=/etc/php5/apache2/php.ini
		cp $FILE $PROG_DIR/php.ini.bak
	}

	# restaura php.ini
	#
	amb.php_ini_restore() {
		local FILE=/etc/php5/apache2/php.ini
		cp $PROG_DIR/php.ini.bak $FILE
	}

	# copia /etc/hosts para pasta do script
	#
	amb.hosts_backup() {
		local FILE=/etc/hosts
		cp $FILE $PROG_DIR/hosts.bak
	}

	# restaura /etc/hosts
	#
	amb.hosts_restore() {
		local FILE=/etc/hosts
		cp $PROG_DIR/hosts.bak $FILE
	}

	# comando: host
	#
	amb.hosts() {
		local MODO=$1

		if [ "$MODO" == "prod" ]
			then
				amb.hosts_para_prod
		elif [ "$MODO" == "dev" ]
			then
				amb.hosts_para_dev
		fiz
	}

	# comando: php
	#
	amb.php() {
		local MODO=$1

		if [ "$MODO" == "erroff" ]
			then
				amb.php_err_off
		elif [ "$MODO" == "erron" ]
			then
				amb.php_err_on
		fi
	}
}

module_amb

#
#
main() {

	local COMANDO=amb.$1
	local MODO=$2

	installer.create_dir
	installer.create_temp_dir

	amb.$COMANDO $MODO
}


main $1 $2

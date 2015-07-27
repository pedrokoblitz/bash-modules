#!/bin/bash
	
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

module_apache() {
	
	readonly APACHE_SITES="/etc/apache2/sites-avaiable"
	readonly APACHE_MODS="/etc/apache2/mods-avaiable"
	readonly WEB_ROOT="/var/www/html"
	readonly SCRIPT_ROOT="/var/www/html/scripts"

    # install apache2 via apt
    #
	apache.install() {
		apt-get -y install apache2
	}

    # install php and extensions via apt
    #
	apache.install_php() {
		apt-get -y install php5 libapache2-mod-php5 php5-mcrypt php5-cli php5-memcache php5-gd php5-curl php5-imagick php5-mysql
	}

    # creates a file with php server info
    #
	apache.generate_php_info() {
		echo "<?php phpinfo();?>" > $APACHE_ROOT/info.php
	}

    # restarts server
    #
	apache.restart() {
		service apache2 restart
	}

    # adds conf and enable site
    #
	apache.add_site() {
		local $CONF=$1
		cp $SCRIPT_ROOT/sites/$CONF $APACHE_SITES/$CONF.conf
		a2ensite $CONF
	}

    # enable mod_rewrite and mod_deflate
    #
	apache.enable_default_mods() {
		a2enmod rewrite
		a2enmod deflate
	}
}

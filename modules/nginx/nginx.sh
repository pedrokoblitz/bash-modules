#!/bin/bash
	
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

module_nginx() {
	
	readonly NGINX_SITES="/etc/nginx/sites-available"
	readonly NGINX_MODS="/etc/nginx/mods-avaiable"
	readonly WEB_ROOT="/usr/share/nginx/www"
	readonly SCRIPT_ROOT="/var/www/html/scripts"

	nginx.apt_update() {
		apt-get update
	}

	nginx.install_nginx() {
		echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/nginx-stable.list
		apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C
		apt-get update
		apt-get install nginx
	}

	nginx.start_nginx() {
		service nginx start
	}

	nginx.restart_nginx() {
		service nginx restart
	}

	nginx.install_php() {
		apt-get install  php5-fpm php5-mcrypt php5-cli php5-memcache php5-gd php5-curl php5-imagick php5-mysql
		sed -i s/cgi.fix_pathinfo\=1/cgi.fix_pathinfo\=1/g /etc/php5/apache2/php.ini
	}

	nginx.configure_fpm() {
		sed -i s/listen\ \=\ 127.0.0.1:9000/listen\ \= \ /var/run/php5-fpm.sock/g /etc/php5/fpm/pool.d/www.conf
		service php5-fpm restart
	}

	nginx.configure_nginx() {
		cat $SCRIPT_ROOT/nginx/config > $NGINX_SITES/default
	}

	nginx.generate_php_info() {
		echo "<?php phpinfo();?>" > $WEB_ROOT/info.php
	}
}


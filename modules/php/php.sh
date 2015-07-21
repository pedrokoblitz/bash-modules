#!/bin/bash
	
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

module_php() {

	php.error_on() {
		sed -i s/display_errors\ =\ Off/display_errors\ =\ On/g /etc/php5/apache2/php.ini
		service apache2 restart
	}

	php.error_off() {
		sed -i s/display_errors\ =\ On/display_errors\ =\ Off/g /etc/php5/apache2/php.ini
		service apache2 restart
	}
}
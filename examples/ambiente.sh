#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

para_dev() {
	sudo cp /home/pedro/.meushosts/dev /etc/hosts
}

para_prod() {
	sudo cp /home/pedro/.meushosts/prod /etc/hosts
}

php_err_on() {
	sed -i s/display_errors\ =\ Off/display_errors\ =\ On/g /etc/php5/apache2/php.ini
	service apache2 restart
}

php_err_off() {
	sed -i s/display_errors\ =\ On/display_errors\ =\ Off/g /etc/php5/apache2/php.ini
	service apache2 restart
}

main() {
	local modo=$1

	if [ "$modo" == "prod" ]
		then
			para_prod

	elif [ "$modo" == "dev" ]
		then
			para_dev

	elif [ "$modo" == "erroff" ]
		then
			php_err_off

	elif [ "$modo" == "erron" ]
		then
			php_err_on
	fi
}

main $1

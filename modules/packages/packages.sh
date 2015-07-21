#!/bin/bash
	
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

module_packages() {

	packages.install_mongodb() {
		apt-get install mongodb
	}

	packages.install_rabbitmq() {
		apt-get install rabbitmq
	}

	packages.install_lxml() {
		apt-get install python-lxml
	}

	packages.install_scrapy() {
		apt-get install scrapy
	}

	packages.install_python_package_managers() {
		apt-get install pip
	}

	packages.install_python_dependencies() {
		pip install ...
	}
}
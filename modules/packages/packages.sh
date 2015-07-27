#!/bin/bash
	
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

module_data_packages() {

	#
	#
	packages.install_python_package_managers() {
		apt-get install python-setuptools
		apt-get install python-pip
	}

	#
	#
	packages.install_data_stores() {
		apt-get install mongodb
		apt-get install rabbitmq
	}

	#
	#
	packages.install_nlp_packages() {
		apt-get install python-nltk
		pip install pattern
	}

	#
	#
	packages.install_scrapy() {
		apt get install python-dev && \
			apt-get install libxslt1-dev libxslt1.1 libxml2-dev libxml2 libssl-dev libffi-dev && \
			apt-get install python-lxml && \
			apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7 && \
			echo 'deb http://archive.scrapy.org/ubuntu scrapy main' | \
				tee /etc/apt/sources.list.d/scrapy.list && \
			apt-get install scrapy
	}

	#
	#
	packages.install_python_dependencies() {
		pip install ...
	}
}

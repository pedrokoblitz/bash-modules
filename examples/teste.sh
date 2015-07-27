#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

usage() {
	cat <<- EOF
		multi line text goes here...
		multi line text goes here...
		multi line text goes here...
	EOF	
}

is_dir() {
    local DIR=$1
    [[ -d $DIR ]]
}

clonar_secult_git() {
	local DIR="/var/www/cultura-rj-gov-br"
	mkdir -p $DIR
	local REPOSITORIO="http://pedrokoblitz@projetos.cincoeuzebio.com/cultura-rj-gov-br.git"
	is_dir $DIR && cd $DIR && git clone $REPOSITORIO
}

clonar_funarj_git() {
	local DIR="/var/www/funarj"
	is_dir $DIR \
		|| mkdir -p $DIR
	local REPOSITORIO="http://pedrokoblitz@projetos.cincoeuzebio.com/funarj.git"
	cd $DIR && git clone $REPOSITORIO
}

clonar_villalobos_git() {
	local DIR="/var/www/villalobos"
	mkdir -p $DIR
	local REPOSITORIO="http://pedrokoblitz@projetos.cincoeuzebio.com/emvl-site.git"
	is_dir $DIR && cd $DIR && git clone $REPOSITORIO
}

clonar_museudoestado_git() {
	local DIR="/var/www/museusdoestado"
	mkdir -p $DIR
	local REPOSITORIO="http://pedrokoblitz@projetos.cincoeuzebio.com/museus-do-estado.git"
	is_dir $DIR && cd $DIR && git clone $REPOSITORIO
}

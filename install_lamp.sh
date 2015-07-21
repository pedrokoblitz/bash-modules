#!/bin/bash

source modules/fs/fs.sh
module_fs

source modules/apache/apache.sh
module_apache

source modules/mysql/mysql.sh
module_mysql

lamp.install() {
    mysql.install abcdi2ea
    mysql.create_user localhost pedro abcdi2ea
    apache.install_apache
    apache.install_php
    apache.restart
}

lamp.add() {
    apache.add_site $1
}

main() {
    local MODO=$1

    if [ "$MODO" == "install" ]
        then
            lamp.install
    elif [ "$MODO" == "add" ]
        then
            local CONF=$2
            if [ fs.is_readable $CONF ]
                then
                    lamp.add $CONF
            fi
    fi
}

main $1 $2

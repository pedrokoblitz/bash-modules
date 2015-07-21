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

main() {
    local MODO=$1

    if [ "$MODO" == "install" ]
        then
            if which mysql && which apache2 && which php
                then
                    echo "Already installed" 
                    exit 0
            else
                lamp.install
            fi
    
    elif [ "$MODO" == "add" ]
        then
            local TYPE=$2
            local FILE=$3
            if [ fs.is_readable $FILE ]
                then
                    if [ "$TYPE" == "site" ]
                        then
                            apache.add_site $FILE
                    elif [ "$TYPE" == "db" ]
                        then
                            local DB=$4
                            mysql.upload $FILE $DB
                    fi
            else
                echo "File $FILE is not readable."
                exit
            fi
    fi
}

main $@ 

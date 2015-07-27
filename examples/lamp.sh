#!/bin/bash

source modules/fs/fs.sh
module_fs

source modules/apache/apache.sh
module_apache

source modules/mysql/mysql.sh
module_mysql

lamp.usage() {
    cat <<- EOF
        multi line text goes here...
        multi line text goes here...
        multi line text goes here...
    EOF 
}

#
#
lamp.is_apache_installed() {
    which apache
}

#
#
lamp.is_php_installed() {
    which php
}

#
#
lamp.is_mysql_installed() {
    which mysql
}

#
#
lamp.are_all_installed() {
    which mysql && which apache2 && which php
}

#
#
lamp.install() {
    if ! lamp.is_mysql_installed
        then
            mysql.install
    fi

    mysql.create_user "localhost" "pedro" "abcdi2ea"

    if ! lamp.is_apache_installed
        then
            apache.install
    fi

    if ! lamp.is_php_installed
        then
            apache.install_php
    fi
    
    apache.restart
}

main() {
    local MODE=$1

    # lamp installer
    if [ "$MODE" == "install" ]
        then
            if lamp.are_all_installed
                then
                    echo "Already installed" 
                    exit 0
            else
                lamp.install
            fi
    
    # lamp add: site || db
    elif [ "$MODE" == "add" ]
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
                            mysql.upload $DB $FILE
                    fi
            else
                echo "File $FILE is not readable."
                exit
            fi
    fi

    # lamp enable/disable modules and sites
    elif [ "$MODE" == "enable" || "$MODE"  == "disable" ]
        then
            local TYPE=$2
            local NAME=$3
            if [ "$TYPE" == "site" ]
                then

            elif [ "$TYPE" == "module" ]
                then

            fi
    fi

}

main $@ 

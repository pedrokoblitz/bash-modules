#!/bin/bash

module_mysql() {

    # db
    # create tables, dump, restore

    #
    #
    #
    mysql.install() {
        if [ "$EUID" -ne 0 ]
          then echo "Please run as root"
          exit
        fi

        local MYSQL_PASSWORD=$1
        debconf-set-selections <<< 'mysql-server mysql-server/root_password password $MYSQL_PASSWORD'
        debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password $MYSQL_PASSWORD'
        apt-get -y install mysql-server
        mysql_install_db
        mysql_secure_installation -n -y
    }

    #
    #
    #
    mysql.create_user() {
        local USER=$1
        local HOST=$2
        local PASSWORD=$3
        local QUERY="CREATE USER $USER@$HOST IDENTIFIED BY $PASSWORD;GRANT ALL PRIVILEGES ON * . * TO $USER@$HOST; FLUSH PRIVILEGES;"
        
        mysql.exec_query $QUERY
    }

    #
    #
    #
    mysql.exec_query() {
        local $QUERY=$1

        mysql --user=$DB_USER --password=$DB_PASSWORD --host=$DB_HOST -e $QUERY
    }

    #
    #
    #
    mysql.exec_query_in_database() {
        local $DB_NAME=$1
        local $QUERY=$2

        mysql --user=$DB_USER --password=$DB_PASSWORD --host=$DB_HOST $DB_NAME -e $QUERY
    }

    #
    #
    #
    mysql.exec_query_in_table() {
        local $DB_NAME=$1
        local TABLE=$2
        local $QUERY=$3

        mysql --user=$DB_USER --password=$DB_PASSWORD --host=$DB_HOST $DB_NAME $TABLE -e $QUERY
    }

    #
    #
    #
    mysql.dump() {
        local DB_NAME=$1
        local FILE=$2

        mysqldump --force --user=$DB_USER --password=$DB_PASSWORD --host=$DB_HOST --databases $DB_NAME > $DB_OUTPUT_DIR"/"$FILE
    }

    #
    #
    #
    mysql.upload() {
        local DB_NAME=$1
        local FILE=$2

        mysql --force --user=$DB_USER --password=$DB_PASSWORD --host=$DB_HOST --databases $DB_NAME < $DB_OUTPUT_DIR"/"$FILE

    }

    #
    #
    #
    mysql.create_database() {
        local DB_NAME=$1
        local QUERY="CREATE DATABASE $DB_NAME;" 
        
        mysql.exec_in_server $QUERY
    }

    #
    #
    #
    mysql.remove_database() {
        local DB_NAME=$1
        local QUERY="DROP DATABASE $DB_NAME;"   
        
        mysql.exec_in_server $QUERY
    }

    #
    #
    #
    mysql.remove_temp_files() {
        rm $DB_OUTPUT_DIR/*gz > /dev/null 2>&1
    }

    #
    #
    #
    mysql.dump_database() {
        local DB_NAME=$1
        local DATESTRING=$(dt_date_str)

        mysqldump --force --opt --user=$DB_USER --password=$DB_PASSWORD --databases $DB_NAME > ${DB_OUTPUT_DIR}/.${DB_NAME}.sql
        gzip $DB_OUTPUT_DIR"/""."$DB_NAME".sql"
        fs.cp $DB_OUTPUT_DIR"/""."$DB_NAME"."$DATESTRING"sql"
    }

    #
    #
    #
    mysql.dump_all_databases() {
        local DATABASES=$(mysql --user=$DB_USER --password=$DB_PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database)
         
        for DB_NAME in $DATABASES; do
            if [[ "$DB_NAME" != "information_schema" ]] && [[ "$DB_NAME" != _* ]] ; then
                mysql.dump_database $DB_USER $DB_PASSWORD $DB_NAME
            fi
        done
    }

    #
    #
    #
    mysql.restore_database() {
        local DB_NAME=$1
        gunzip < ${DB_OUTPUT_DIR}/${DB_NAME}.sql | mysql -u$DB_USER -p$DB_PASSWORD $DB_NAME
    }

    # mysql script http://www.mysqltutorial.org/import-csv-file-mysql-table/
    # bash script http://lubos.rendek.org/import-data-from-csv-file-to-mysql-with-bash-script
    mysql.insert_csv() {
        local DB_NAME=$1
        local TABLE=$2
        local CSV_FILE=$3
        local FIELDS=$4 # example -> "name,url,type,descr"
        local QUERY="LOAD DATA LOCAL INFILE ${CSV_FILE} INTO TABLE ${TABLE} FIELDS TERMINATED BY ';' (${FIELDS})"

        mysql.exec_in_database $DB_NAME
    }
}

#!/bin/bash

readonly DB_USER="janelaalta"
readonly DB_PASSWORD="alta123"
readonly DB_HOST="tresrstudio.cpjxjhydgpyx.sa-east-1.rds.amazonaws.com"

db_exec_in_database() {

    local $DB_NAME=$1
    local $QUERY=$2

    mysql --user=$DB_USER --password=$DB_PASSWORD --host=$DB_HOST $DB_NAME -e $QUERY
}

db_dump() {

    local DB_NAME=$1

    mysqldump --force --user=$DB_USER --password=$DB_PASSWORD --host=$DB_HOST --databases $DB_NAME
}

db_dump_table() {

    local DB_NAME=$1
    local TABLE=$2

    mysqldump --force --user=$DB_USER --password=$DB_PASSWORD --host=$DB_HOST --databases $DB_NAME
}

db_table_into_table() {

	db_exec_in_database
}

db_diff_dbs() {

	local DB1="infantil"
	local DB2="infantil_20150301"

	diff <(db_dump $DB1) <(db_dump $DB2)
}





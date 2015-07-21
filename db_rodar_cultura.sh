#!/bin/bash

readonly DB_USER="CulturaP"
readonly DB_PASSWORD="fApPxzENYETG32F7"
readonly DB_HOST="192.168.3.35"
readonly SOURCE_DB="SECULT_Portal"
readonly TARGET_DB="SECULT_Portal"
readonly DUMP_FILE="~/secult_db.sql"

dump_db_data() {
	mysqldump -u$DB_USER -p$DB_PASSWORD -h$DB_HOST --default-character-set=latin1 $SOURCE_DB > $DUMP_FILE
}

create_and_verify_db() {
	readonly QUERY="CREATE DATABASE $TARGET_DB CHARACTER SET UTF8 COLLATE utf8_unicode_ci; SHOW CREATE DATABASE $TARGET_DB;"
	mysql -u$DB_USER -p$DB_PASSWORD -h$DB_HOST -e $QUERY
}

load_db_data() {
	mysql -u$DB_USER -p$DB_PASSWORD -h$DB_HOST --default-character-set=utf8 -u root -p $TARGET_DB < $DUMP_FILE
}

replace_encoding() {
	sed -e 's/SET NAMES latin1/SET NAMES utf8/g' -i $DUMP_FILE
	sed -e 's/CHARSET=latin1/CHARSET=utf8 COLLATE=utf8_unicode_ci/g' -i $DUMP_FILE
}

conversion_strategy_one() {
	iconv -f LATIN1 -t UTF-8 < $DUMP_FILE > $DUMP_FILE
}

conversion_strategy_two() {
	iconv -f UTF-8 -t LATIN1 < $DUMP_FILE > $DUMP_FILE
}

check_migration() {
	local QUERY="show variables like 'collation%'; show variables like 'character%';"
	mysql -u$DB_USER -p$DB_PASSWORD -h$DB_HOST -e $QUERY
}

rodar_cultura() {
	dump_db_data
}
#!/bin/bash

readonly FILENAME=dump.sql
readonly DB_USER=root
readonly DB_PASS=root
readonly DB_NAME=SECULT_Portal

load_utf8() {
	mysql -u${DB_USER} -p${DB_PASS} --default-character-set=utf8 $DB_NAME < $FILENAME
}

change_charset() {
	sed -i 's/SET NAMES latin1/SET NAMES utf8/' $FILENAME
	sed -i 's/DEFAULT CHARSET=latin1/DEFAULT CHARSET=utf8/' $FILENAME
}

change_collation() {
	sed -i 's/latin1_general_ci/utf8_general_ci/' $FILENAME
}

main() {

}
#!/bin/bash

readonly SOURCE_DB=SECULT_Portal
readonly TARGET_DB=""
readonly DUMP_FILE=~/secult_db.sql

usage() {
	cat <<- EOF
		multi line text goes here...
		multi line text goes here...
		multi line text goes here...
	EOF	
}

#
#
dump_db_data() {
	mysqldump -u$DB_USER -p$DB_PASSWORD -h$DB_HOST --default-character-set=latin1 $SOURCE_DB > $DUMP_FILE
}

#
#
create_and_verify_db() {
	readonly QUERY="CREATE DATABASE $TARGET_DB CHARACTER SET UTF8 COLLATE utf8_unicode_ci; SHOW CREATE DATABASE $TARGET_DB;"
	mysql -u$DB_USER -p$DB_PASSWORD -h$DB_HOST -e $QUERY
}

#
#
load_db_data() {
	mysql -u$DB_USER -p$DB_PASSWORD -h$DB_HOST --default-character-set=utf8 -u root -p $TARGET_DB < $DUMP_FILE
}

#
#
replace_encoding() {
	sed -e 's/SET NAMES latin1/SET NAMES utf8/g' -i $DUMP_FILE
	sed -e 's/CHARSET=latin1/CHARSET=utf8 COLLATE=utf8_unicode_ci/g' -i $DUMP_FILE
}

#
#
conversion_strategy_one() {
	iconv -f LATIN1 -t UTF-8 < $DUMP_FILE > $DUMP_FILE
}

#
#
conversion_strategy_two() {
	iconv -f UTF-8 -t LATIN1 < $DUMP_FILE > $DUMP_FILE
}

#
#
check_migration() {
	local QUERY="show variables like 'collation%'; show variables like 'character%';"
	mysql -u$DB_USER -p$DB_PASSWORD -h$DB_HOST -e $QUERY
}

#
#
rodar_cultura() {
	dump_db_data
	replace_encoding
}

#
#
rodar_local() {
	create_and_verify_db
	load_db_data
	check_migration
}



# ---------------

#!/bin/bash

readonly FILENAME=dump.sql
readonly DB_USER=root
readonly DB_PASS=root
readonly DB_NAME=SECULT_Portal

load_utf8() {
	mysql -u${DB_USER} -p${DB_PASS} --default-character-set=utf8 $DB_NAME < $FILENAME
}


#
#
get_file_encoding() {
    local INFO=$(file $1)
    if [[ $INFO == *"UTF-8"* ]]; then
        echo "utf-8"
    elif [[ $INFO == *"ISO-8859"* ]]; then
        echo "iso-8859-1"
    elif [[ $INFO == *"ASCII"* ]]; then
        echo "ascii"
    fi
}

#
#
change_charset() {
	sed -i 's/SET NAMES latin1/SET NAMES utf8/' $FILENAME
	sed -i 's/DEFAULT CHARSET=latin1/DEFAULT CHARSET=utf8/' $FILENAME
}

#
#
change_collation() {
	sed -i 's/latin1_general_ci/utf8_general_ci/' $FILENAME
}

#
#
change_all() {
	sed -i 's/latin1/utf8/' $FILENAME
}

#
#
main() {

}


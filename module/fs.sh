#!/bin/bash

_fs() {

    # fs default
    # aliases for common bash commands

    fs.cat() {

        local PATH=$1

        cat $PATH
    }

    fs.rm() {

        local PATH=$1

        rm $PATH
    }

    fs.rmdir() {

        local PATH=$1

        rm -rf $PATH
    }

    fs.rmr() {

        local PATH=$1
        local PATTERN=$1

        find $PATH -name $PATTERN | xargs rm
    }

    fs.cp() {

        local SOURCE=$1
        local DESTINATION=$2

        cp -a $SOURCE $DESTINATION
    }

    fs.mv() {

        local SOURCE=$1
        local DESTINATION=$2

        mv $SOURCE $DESTINATION
    }

    fs.cpr() {

        local SOURCE=$1
        local DESTINATION=$2

        cp -ar $SOURCE $DESTINATION
    }

    fs.sort() {

        local SOURCE=$1

        sort $SOURCE
    }

    fs.uniq() {

        local SOURCE=$1

        uniq $SOURCE
    }

    # fs
    # check file state

    fs.is_empty() {

        local FILE=$1

        [[ -z $FILE ]]
    }

    fs.is_not_empty() {

        local FILE=$1

        [[ -n $FILE ]]
    }

    # -r file     Check if file is readable.
    fs.is_readable() {

        local FILE=$1

        [[ -r $FILE ]]
    }

    # -w file     Check if file is writable.
    fs.is_writable() {

        local FILE=$1

        [[ -w $FILE ]]
    }

    # -x file     Check if we have execute access to file.
    fs.is_executable() {
     
        local FILE=$1

        [[ -x $FILE ]]
    }

    # -f file     Check if file is an ordinary file (as opposed to a directory, a device special file, etc.)
    fs.is_file() {

        local FILE=$1

        [[ -f $FILE ]]
    }

    # -d file     Check if file is a directory.
    fs.is_directoryectory() {

        local FILE=$1

        [[ -d $FILE ]]
    }

    # -e file     Check if file exists.  Is true even if file is a directory.
    fs.exists() {

        local FILE=$1

        [[ -e $FILE ]]

    }

    # fs
    # file create operations

    fs.create_tmp_dir() {

    	local PATH=$1
        mkdir -p $1"/tmp"
    }

    fs.delete_tmp_dir() {

        local PATH=$1
        rm -rf $1"/tmp"
    }

    fs.create_dir_tree() {

        local PATH=$1
        mkdir -p $1
    }

    fs.create_dir_if_needed() {
        
        local DIR=$1

        [[ -d $DIR ]] \
            || mkdir -p $DIR

        readlink -m $DIR
    }

    fs.create_file() {

        local PATH=$1
        local FILE=$2    

        touch $PATH$FILE
    }

    fs.create_app_file() {

        local PATH=$APP_DIR
        local FILE=$1    

        fs.create_file $PATH $FILE
    }

    fs.create_temp_file() {

        mktemp $APP_DIR"/"$APP".XXXXXXXXXX.tmp" || { echo "Failed to create temp file"; exit 1; }
    }

    # fs 
    # file/string manipulation

    fs.prepend_line_to_file()
    {

        local FILE=$1
        local LINE=$2

        echo $LINE | cat - $FILE > temp && mv temp $FILE
    }

    fs.append_line_to_file() {

        local FILE=$1; shift
        local LINE=$@

        echo $LINE >> $FILE
    }

    fs.delete_line_from_file() {

        local FILE=$1; shift
        local LINE=$@

        sed -i "/^$LINE/d" $FILE
    }

    fs.get_last_line_from_file() {

        local FILE=$1

        tail -n 1 $FILE
    }

    fs.get_first_line_from_file() {

        local FILE=$1

        head -1 $FILE
    }

    fs.delete_first_line_from_file() {

        local FILE=$1

        tail -n +2 $FILE
    }

    fs.delete_first_line_from_file_if_empty() {

        local FILE=$1

        sed "1{/^$/d}" < $FILE
    }

    fs.delete_last_line_from_file() {

        local FILE=$1

        truncate -s -"$(fs.get_last_line_from_file $FILE | wc -c)" $FILE
    }

    fs.line_in_file() {

        local F=$1; shift
        local LINE=$@

        grep -q "^$LINE$" $F
    }

    fs.add_line_to_file_if_not_exist() {

        local F=$1; shift
        local LINE=$@

        line_in_file $F $LINE \
            || add_line_to_file $F $LINE
    }

    fs.newline_to_space() {

        local FILE=$1
        sed -i ':a;N;$!ba;s/\n/ /g' $FILE
    }

    fs.remove_empty_lines() {

        local FILE=$1

        sed -i '/^\s*$/d' $FILE
    }

    fs.trim() {

        local FILE=$1

        sed -i 's/[ \t]*$//' $FILE
    }

    fs.remove_all_whitespace() {

        local FILE=$1

        cat $FILE | tr -d "[:space:]" > $FILE
    }

    fs.count_lines() {

        wc -l < $1
    }

    fs.replace_in_file_recursively() {

        local DIR=$1
        local STRING=$2
        local REPLACEMENT=$3
        
        find $DIR -type f -print0 | xargs -0 sed -i s/$STRING/$REPLACEMENT/g
    }

    fs.replace_in_file() {

        local FILE=$1
        local STRING=$2
        local REPLACEMENT=$3
        
        cat $1 | sed s/$2/$3/ > $1
    }

    fs.replace_in_single_file() {

        local ORIGINAL=$1
        local STRING=$3
        local REPLACEMENT=$4
        local NEW=$2

        cat $ORIGINAL | sed s/$STRING/$REPLACEMENT/g > $NEW
    }

    fs.replace_in_all_files() {

        local STRING=$1
        local REPLACEMENT=$2
        local PATTERN=$3 # example -> "*.jpg"

        sed -i "s/"$STRING"/"$REPLACEMENT"/g" $PATTERN
    }

    # fs permission
    # common ownership and permission operations

    fs.change_permission() {

        local TARGET=$2
        local PERMISSION=$1

        if [[ -d $TARGET ]]; then

            chmod -R $PERMISSION $TARGET

        elif [[ -d $TARGET ]]; then

            chmod $PERMISSION $TARGET
        fi
    }

    fs.executable_permission() {

        local TARGET=$1
        local PERMISSION="+x"

        fs.change_permission $PERMISSION $TARGET
    }

    fs.web_readable_permission() {

        local TARGET=$1
        local PERMISSION=755

        fs.change_permission $PERMISSION $TARGET
    }

    fs.group_own() {

        local TARGET=$3
        local USER=$1
        local GROUP=$2

        if [[ -d $TARGET ]]; then

            chmod -R $PERMISSION $TARGET

        elif [[ -f $TARGET ]]; then

            chmod $PERMISSION $TARGET
        fi


        chown $USER":"$GROUP $TARGET
    }

    fs.web_permission() {

        fs.change_permission 755 
    }

    fs.group_web_own() {

        fs.group_own www-data www-data /var/www/
    }

    fs.default_date_delimiter() {
        echo "-"
    }

    # fs date
    # common bash date operations

    fs.date_str() {

        local delimiter=${1:-$(default_date_delimiter)}

        date +%Y${delimiter}%m${delimiter}%d
    }

    fs.time_str() {

        local delimiter=${1:-$(default_date_delimiter)}

        date +%H${delimiter}%M
    }

    fs.time_with_seconds_str() {

        local delimiter=${1:-$(default_date_delimiter)}

        date +%H${delimiter}%M${delimiter}%S
    }

    fs.date_time_str() {

        local delimiter=${1:-$(default_date_delimiter)}
        local hour_delimiter=${2:-"-"}

        echo $(date_str $delimiter)${hour_delimiter}$(time_str $delimiter)
    }

    fs.date_time_with_seconds_str() {
        
        local delimiter=${1:-$(default_date_delimiter)}
        local hour_delimiter=${2:-"-"}

        echo $(date_str $delimiter)${hour_delimiter}$(time_with_seconds_str $delimiter)
    }
}

#!/bin/bash

module_fs() {

    # fs default
    # aliases for common bash commands

    readonly SERVER_WEB_ROOT=/var/www/

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

    fs.cpr() {
        local SOURCE=$1
        local DESTINATION=$2
        cp -ar $SOURCE $DESTINATION
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
    fs.is_directory() {
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
    fs.create_temp_dir() {
    	local PATH=$1
        mkdir -p $1/tmp
    }

    #
    #
    fs.delete_temp_dir() {
        local PATH=$1
        rm -rf $1/tmp \
            || rm -rf ./tmp \
            || { echo "Failed to remove temp dir"; exit 1; }
    }

    #
    #
    fs.create_dir_tree() {
        local PATH=$1
        mkdir -p $1
    }

    #
    #
    fs.create_dir_if_needed() {
        local DIR=$1
        [[ -d $DIR ]] \
            || mkdir -p $DIR
        readlink -m $DIR
    }

    #
    #
    fs.create_file() {
        local PATH=$1
        local FILE=$2    
        touch $PATH$FILE
    }

    #
    #
    fs.create_app_file() {
        local PATH=$PROG_DIR
        local FILE=$1    
        fs.create_file $PATH $FILE
    }

    #
    #
    fs.create_temp_file() {
        mktemp /tmp/$PROG.XXXXXXXXXX.tmp \
            || { echo "Failed to create temp file"; exit 1; }
    }

    # fs 
    # file/string manipulation
    fs.prepend_line_to_file()
    {
        local FILE=$1
        local LINE=$2
        echo $LINE | cat - $FILE > temp && mv temp $FILE
    }

    #
    #
    fs.append_line_to_file() {
        local FILE=$1; shift
        local LINE=$@
        echo $LINE >> $FILE
    }

    #
    #
    fs.delete_line_from_file() {
        local FILE=$1; shift
        local LINE=$@
        sed -i "/^$LINE/d" $FILE
    }

    #
    #
    fs.get_last_line_from_file() {
        local FILE=$1
        tail -n 1 $FILE
    }

    #
    #
    fs.get_first_line_from_file() {
        local FILE=$1
        head -1 $FILE
    }

    #
    #
    fs.delete_first_line_from_file() {
        local FILE=$1
        tail -n +2 $FILE
    }

    #
    #
    fs.delete_first_line_from_file_if_empty() {
        local FILE=$1
        sed "1{/^$/d}" < $FILE
    }

    #
    #
    fs.delete_last_line_from_file() {
        local FILE=$1
        truncate -s -"$(fs.get_last_line_from_file $FILE | wc -c)" $FILE
    }

    #
    #
    fs.line_in_file() {
        local FILE=$1; shift
        local LINE=$@
        grep -q "^$LINE$" $FILE
    }

    #
    #
    fs.add_line_to_file_if_not_exist() {
        local FILE=$1; shift
        local LINE=$@
        line_in_file $FILE $LINE \
            || add_line_to_file $FILE $LINE
    }

    #
    #
    fs.newline_to_space() {
        local FILE=$1
        sed -i ':a;N;$!ba;s/\n/ /g' $FILE
    }

    #
    #
    fs.remove_empty_lines() {
        local FILE=$1
        sed -i '/^\s*$/d' $FILE
    }

    #
    #
    fs.trim() {
        local FILE=$1
        sed -i 's/[ \t]*$//' $FILE
    }

    #
    #
    fs.remove_all_whitespace() {
        local FILE=$1
        cat $FILE | tr -d "[:space:]" > $FILE
    }

    #
    #
    fs.count_lines() {
        local FILE=$1
        wc -l < $FILE
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

    #
    #
    fs.executable_permission() {
        local TARGET=$1
        local PERMISSION=+x
        fs.change_permission $PERMISSION $TARGET
    }

    #
    #
    fs.readable_permission() {
        local TARGET=$1
        local PERMISSION=755
        fs.change_permission $PERMISSION $TARGET
    }

    #
    #
    fs.group_own() {
        local TARGET=$3
        local USER=$1
        local GROUP=$2
        chown $USER:$GROUP $TARGET
    }

    #
    #
    fs.group_apache_webroot_own() {
        chown -R www-data:www-data $SERVER_WEB_ROOT
    }
}

module_fs

#!/bin/bash

module_fs() {

    # aliases for common bash commands

    declare SERVER_WEB_ROOT=/var/www/

    # remove directory
    #
    fs.rm_dir() {
        local PATH=$1
        rm -rf $PATH
    }

    # recursevely remove files of some pattern
    #
    fs.rm_recursive() {
        local PATH=$1
        local PATTERN=$1
        find $PATH -name $PATTERN | xargs rm
    }

    # recursevely copy files
    #
    fs.cp_recursive() {
        local SOURCE=$1
        local DESTINATION=$2
        cp -ar $SOURCE $DESTINATION
    }

    # check file state

    # check if empty
    #
    fs.is_empty() {
        local FILE=$1
        [[ -z $FILE ]]
    }

    # check if not empty
    #
    fs.is_not_empty() {
        local FILE=$1
        [[ -n $FILE ]]
    }

    # -r file     Check if file is readable.
    #
    fs.is_readable() {
        local FILE=$1
        [[ -r $FILE ]]
    }

    # -w file     Check if file is writable.
    #
    fs.is_writable() {
        local FILE=$1
        [[ -w $FILE ]]
    }

    # -x file     Check if we have execute access to file.
    #
    fs.is_executable() {
        local FILE=$1
        [[ -x $FILE ]]
    }

    # -f file     Check if file is an ordinary file (as opposed to a directory, a device special file, etc.)
    #
    fs.is_file() {
        local FILE=$1
        [[ -f $FILE ]]
    }

    # -d file     Check if file is a directory.
    #
    fs.is_directory() {
        local FILE=$1
        [[ -d $FILE ]]
    }

    # -e file     Check if file exists.  Is true even if file is a directory.
    #
    fs.exists() {
        local FILE=$1
        [[ -e $FILE ]]
    }

    # file create operations

    # create dir if it doesnt exists
    #
    fs.create_dir_if_needed() {
        local DIR=$1
        [[ -d $DIR ]] \
            || mkdir -p $DIR
        readlink -m $DIR
    }

    # create temp file
    #
    fs.create_tmp_file() {
        mktemp /tmp/$PROG.XXXXXXXXXX.tmp \
            || { echo "Failed to create temp file"; exit 1; }
    }

    # file/string manipulation

    # add line to begining of file
    # 
    fs.prepend_line()
    {
        local FILE=$1
        local LINE=$2
        echo $LINE | cat - $FILE > temp && mv temp $FILE
    }

    # add line to end of file
    #
    fs.append_line() {
        local FILE=$1; shift
        local LINE=$@
        echo $LINE >> $FILE
    }

    fs.delete_line() {
        local FILE=$1; shift
        local LINE=$@
        sed -i "/^$LINE/d" $FILE
    }

    fs.get_last_line() {
        local FILE=$1
        tail -n 1 $FILE
    }

    fs.get_first_line() {
        local FILE=$1
        head -1 $FILE
    }

    fs.delete_first_line() {
        local FILE=$1
        tail -n +2 $FILE
    }

    fs.delete_first_line() {
        local FILE=$1
        sed "1{/^$/d}" < $FILE
    }

    fs.delete_last_line() {
        local FILE=$1
        truncate -s -"$(fs.get_last_line_from_file $FILE | wc -c)" $FILE
    }

    # check if line is in file
    #
    fs.line_in_file() {
        local FILE=$1; shift
        local LINE=$@
        grep -q "^$LINE$" $FILE
    }

    # add if it not exists
    #
    fs.add_line_to_file_if_needed() {
        local FILE=$1; shift
        local LINE=$@
        line_in_file $FILE $LINE \
            || add_line_to_file $FILE $LINE
    }

    # convert all newlines to spaces
    #
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
        local FILE=$1
        wc -l < $FILE
    }

    # common ownership and permission operations

    fs.change_permission() {
        local PERMISSION=$1
        local TARGET=$2

        if [[ -d $TARGET ]]; then
            chmod -R $PERMISSION $TARGET
        elif [[ -f $TARGET ]]; then
            chmod $PERMISSION $TARGET
        fi
    }

    fs.executable_permission() {
        local TARGET=$1
        chmod +x $TARGET
    }

    #
    #
    fs.readable_permission() {
        local TARGET=$1
        fs.change_permission 755 $TARGET
    }

    #
    #
    fs.group_own() {
        local OWNERSHIP=$1
        local TARGET=$3
        chown $OWNERSHIP $TARGET
    }
}

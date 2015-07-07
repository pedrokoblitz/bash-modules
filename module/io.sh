#!/bin/bash

_io() {

    # fs io
    # temp file io control

    declare IO_OUTPUT=$(fs.mktemp)

    io.null() {

        fs.cat /dev/null
    }

    io.output() {

        local OUTPUT=$1

        fs.cat $OUTPUT
    }

    io.output_escape() {

        printf $(io.output)
    }

    io.write() {

        local INPUT=""
        local OUTPUT=$2

        if [[ fs.is_empty ]]; then

            INPUT=$1

        else

            INPUT=$OUTPUT"\n"$1
        fi

        fs.cat $INPUT >> $OUTPUT
    }

    io.open() {

        local NAME=$1
        local SAVED_FILE=$APP_DIR$DIR"/"$NAME"."$APP_EXTENSION
        local OUTPUT=$3

        fs.cat $SAVED_FILE > $OUTPUT
    }

    io.save() {

        local NAME=$1
        local SAVED_FILE=$APP_DIR$DIR"/"$NAME"."$APP_EXTENSION

        io.output_escape > $SAVED_FILE
    }

    io.clear() {

        local OUTPUT=$1

        io.null > $OUTPUT
    }

    io.save_and_clear() {

        io.save $1
        io.clear
    }

    io.remove_tmp_file() {

        local OUTPUT=$1

        fs.rm $OUTPUT
    }

    io.remove_temp_files() {

        fs.rm $APP_DIR"/tmp/*"
    }

    # Close input file descriptor n. --> n<&-
    # Close output file descriptor n. --> n>&-
    # Close stdin. --> 0<&-, <&-
    # Close stdout. --> 1>&-, >&-
    # Close stderr. --> 2>&-
    # Close fd3. --> 3>&-
    #
    #
    # exec 5>/tmp/foo       # open /tmp/foo for writing, on fd 5
    # exec 6</tmp/bar       # open /tmp/bar for reading, on fd 6
    # cat <&6 |             # call cat, with its standard input connected to
    #                       # what is currently fd 6, i.e. /tmp/bar
    # while read a; do      # 
    #   echo $a >&5         # write to fd 5, i.e. /tmp/foo
    # done                  # 
    # to file descriptor 3
    # 3 - 9 are for open files and need to be open
    #
    #
 
    io.stdin_save() {

      local N=$1
      exec $N>&0 
    }

    io.stdin_restore() {

      local N=$1
      exec 0<&$N
    }

    io.stdin_close() {
        
        0<&-, <&-
    }

    io.stout_save() {

      local N=$1
      exec $N>&1
    }

    io.stdout() {
        
        1>&-, >&-
    }

    io.stderr_close() {
        
        2>&-
    }

   io.open() {

      local N=$1
      local FILE=$2
        exec $N<> $FILE  #open io.
    }

    # for reading --> exec $N < file

    io.write_line() {

      local N=$1
      local LINE=$2
        echo $LINE >&$N
    }

    io.read_line() {

      local N=$1
        read -r <&$N
    }

    io.close() {

      local N=$1
        exec $N>&- #close io.
    }

    io.stdout_to_file() {

      local FILE=$1
      
      exec 2>$FILE
    }

    io.stderr_to_file() {

      local FILE=$1
      
      exec 2>>$FILE
    }

    io.stderr_to_stdout() {

      exec 2>&1  
    }

    # command < input-file > output-file
}

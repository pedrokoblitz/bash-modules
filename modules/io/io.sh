#!/bin/bash

module_io() {

    # returns null
    #
    io.null() {
        cat /dev/null
    }

    # returns output
    #
    io.output() {
        local OUTPUT=$1
        cat $OUTPUT
    }

    # returns escaped output
    #    
	io.output_escape() {
        printf $(io.output $1) 
    }

    # write/append to output
    #    
	io.write() {
        local OUTPUT=$2
        if [[ -z $INPUT ]]; then
            local INPUT=$1
        else
            local INPUT=${OUTPUT}"\n"${1}
        fi
        cat $INPUT >> $OUTPUT
    }

    # open file and write to output
    #    
	io.open() {
        local NAME=$1
        local SAVED_FILE=${PROG_DIR}/${NAME}
        local OUTPUT=$3
        cat $SAVED_FILE > $OUTPUT
    }

    # save file
    #    
	io.save() {
        local NAME=$1
        local SAVED_FILE=${PROG_DIR}/${NAME}
        io.output_escape > $SAVED_FILE
    }

    # clear file
    #    
	io.clear() {
        local OUTPUT=$1
        io.null > $OUTPUT
    }

    #
    #    
	io.save_and_clear() {
        io.save $1
        io.clear
    }

    #
    #    
	io.remove_temp_file() {
        local OUTPUT=$1
        rm -f $OUTPUT
    }

    #
    #    
	io.remove_temp_files() {
        rm -f $PROG_DIR/tmp/*
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
                            # what is currently fd 6, i.e. /tmp/bar
    # while read a; do      # 
    #   echo $a >&5         # write to fd 5, i.e. /tmp/foo
    # done                  # 
    # to file descriptor 3
    # 3 - 9 are for open files and need to be open
    #
    #
 
    #
    #    
	io.stdin_save() {
      local N=$1
      exec $N>&0 
    }

    #
    #    
	io.stdin_restore() {
      local N=$1
      exec 0<&$N
    }

    #
    #    
	io.stdin_close() {
        0<&-, <&-
    }

    #
    #    
	io.stdout_save() {
      local N=$1
      exec $N>&1
    }

    #
    #    
	io.stdout() {
        1>&-, >&-
    }

    #
    #    
	io.stderr_close() {
        2>&-
    }

    #
    #    
	io.open() {
       local N=$1
       local FILE=$2
       exec $N<> $FILE  #open io.
    }

    # for reading --> exec $N < file
    #
    io.write_line() {
       local N=$1
       local LINE=$2
       echo $LINE >&$N
    }

    #
    #    
	io.read_line() {
        local N=$1
        read -r <&$N
    }

    #
    #    
	io.close() {

      local N=$1
        exec $N>&- #close io.
    }

    #
    #    
	io.stdout_to_file() {
      local FILE=$1
      exec 2>$FILE
    }

    #
    #    
	io.stderr_to_file() {
      local FILE=$1
      exec 2>>$FILE
    }

    #
    #    
	io.stderr_to_stdout() {
      exec 2>&1  
    }
}

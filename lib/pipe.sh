#!/bin/bash

# script 1
declare PIPE=/tmp/testPIPE

trap "rm -f $PIPE" EXIT

# create pipe file
if [[ ! -p $PIPE ]]; then
    mkfifo $PIPE
fi

while true
do
    if read line < $PIPE; then
        if [[ "$line" == 'quit' ]]; then
            break
        fi
        echo $line
    fi
done

echo "Reader exiting"

# script 2
declare PIPE=/tmp/testPIPE

if [[ ! -p $PIPE ]]; then
    echo "Reader not running"
    exit 1
fi

if [[ "$1" ]]; then
    echo "$1" > $PIPE
else
    echo "Hello from $$" > $PIPE
fi
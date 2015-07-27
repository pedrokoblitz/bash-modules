#!/bin/bash

module_pid() {

    readonly PID_STORE=$USER_HOME/.${PROG_DIR}/pid/${PROG_$BASHPID}.pid

    # sleep 5 seconds
    #
    pid.delay() {
        sleep 5
    }

    # prints pid
    #
    pid.self() {
        echo $$
    }

    # prints pid from last run
    #
    pid.last_run() {
        echo $!
    }

    # get pid
    #
    pid.get() {
        local FILE=$PID_STORE
        cat $FILE
    }

    # kill pid process
    #
    pid.kill_proc() {
        local PID=$1
        kill -9 $PID
    }

    # kill this process
    #
    pid.kill_self() {
        pid.kill_proc $(pid.self)
    }

    # kill last process
    #
    pid.kill_last() {
        pid.kill_proc $(pid.last_run)
    }

    # store pid in file
    #
    pid.store() {
        echo $$ > $PID_STORE
    }

    # store last pid in file
    #
    pid.store_last() {
        echo $! > $PID_STORE
    }

    # clear file
    #
    pid.clear() {
        echo /dev/null > $PID_STORE
    }

    # generate lockfile
    #
    pid.lock() {
        local FILE=$1
        lockfile -r 0 $FILE
    }

    # remove lockfile
    #
    pid.unlock() {
        local FILE=$PID_STORE
        if ! [[ -f $FILE && pid.lock ]]; then
            rm -f $FILE
        fi
    }
}

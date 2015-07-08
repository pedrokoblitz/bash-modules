#!/bin/bash

module_pid() {

    readonly PID_STORE=$USER_HOME/.${PROG_DIR}/pid/${PROG_$BASHPID}.pid

    #
    #
    #
    pid.delay() {
        sleep 5
    }

    #
    #
    #
    pid.self() {
        echo $$
    }

    #
    #
    #
    pid.last_run() {
        echo $!
    }

    #
    #
    pid.get() {
        local FILE=$1
        cat FILE
    }

    #
    #
    #
    pid.kill_proc() {
        local PID=$1
        kill -9 $PID_STORE
    }

    #
    #
    #
    pid.kill_self() {
        pid.kill_proc $(pid.self)
    }

    #
    #
    #
    pid.kill_last() {
        pid.kill_proc $(pid.last_run)
    }

    #
    #
    #
    pid.store() {
        echo $$ > $PID_FILE
    }

    #
    #
    #
    pid.store_last() {
        echo $! > $PID_FILE
    }

    #
    #
    #
    pid.clear() {
        echo /dev/null > $PID_FILE
    }

    #
    #
    #
    pid.lock() {
        local FILE=$1
        lockfile -r 0 $FILE
    }

    #
    #
    #
    pid.unlock() {
        if ! [[ -f $FILE && pid.lock ]]; then
            rm -f $FILE
        fi
    }
}

module_pid

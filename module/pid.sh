#!/bin/bash

module_pid() {

    # default sleep time
    readonly PID_DEFAULT_DELAY=5
    # PID store
    readonly PID_STORE=$HOME"/.bash_ ipc/"$APP"_"$BASHPID".pid"

    #
    #
    #
    pid.delay() {
        sleep $PID_DEFAULT_DELAY
    }

    #
    #
    #
    pid.get_self() {
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
    #
    pid.get() {
        local FILE=$1
        fs.cat FILE
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
        pid.kill_proc $(pid.get_self)
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
            fs.rm -f $FILE
        fi
    }
}

#!/bin/bash

module_async() {

    # run script on background with nohup
    #
    async.run_on_background() {
        local SCRIPT=$1
        # nohup doesn't hangup when you close the terminal and output by default goes to nohup.out
        # You can combine this with backgrounding, and get rid of the output,
        nohup $SCRIPT > /dev/null 2>&1 &
    }

    # loop in background using subshells
    #
    async.spawn_via_loop() {
        local SCRIPT=$1
        local N=$2
        # "spawning $N processes"
        for i in $(seq 1 $N) ;
        do
            (   
                # subshell/closure 
                async.run_on_background $SCRIPT
            )
        done
    }

    # loop using parallel
    #
    async.spawn_via_parallel() {
        local SCRIPT=$1
        local N=$2
        # spawning $N processes
        # Without -j0 it will spawn one process per CPU.
        # echo $PARAMS_LIST | \
        #   parallel -j0 $SCRIPT  ::: { 1..$N }
        parallel -j0 $SCRIPT ::: $(seq 1 $N)
    }

    # loop using xargs
    #
    async.spawn_via_xargs() {
        local SCRIPT=$1
        local N=$2
        local PARAM_LIST=$3
        echo $PARAM_LIST | \
            xargs -n 1 -P $N $SCRIPT -q
    }
}

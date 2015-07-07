#!/bin/bash

_async() {


    async.run_on_background() {

        local SCRIPT=$1

        # nohup doesn't hangup when you close the terminal and output by default goes to nohup.out
        # You can combine this with backgrounding, and get rid of the output,
        nohup $SCRIPT > /dev/null 2>&1 &
    }

    async.spawn_via_loop() {

        local SCRIPT=$1
        local N=$2

        # "spawning $N processes"
        for i in $(seq 1 $N) ;
        do
            
            (   # subshell/closure 
                async.run_on_background $SCRIPT
            )
        
        done
    }

    async.spawn_via_parallel() {

        local SCRIPT=$1
        local N=$2

        # echo "Spawning 100 processes"
        # Without -j0 it will spawn one process per CPU.
        parallel -j0 $SCRIPT ::: $(seq 1 $N)

        # echo $PARAMS_LIST | parallel -j0 $SCRIPT  ::: { 1..$N }
    }

    # wget example, multiple urls
    async.spawn_via_xargs() {

        local SCRIPT=$1
        local N=$2
        local PARAM_LIST=$3

        echo $PARAM_LIST | xargs -n 1 -P $N $SCRIPT -q
    }

    #while true
    #do
    #    if read LINE < $NC_OUTPUT; then
    #        
    #        if [[ "$LINE" == 'quit' ]]; then
    #        
    #            break
    #        fi
    #
    #        echo $LINE
    #    fi
    #done
}

# fifo to subshell 
PIPE="/tmp/pipe.$$"
mkfifo $PIPE

(
echo 'value' > $PIPE &
)

VARIABLE=`cat $PIPE`
echo $VARIABLE
rm $PIPE

# fifo to subshell 2
#!/bin/bash

TMPFIFO="/tmp/fifo.$$"
 
mknod $TMPFIFO p
 
(
       echo 'value' > $TMPFIFO &
)

# fifo to subshell 3
FIFO="/tmp/fifo.$$"
if ! [ -p "$FIFO" ]; then
  mkfifo "$FIFO"
fi
{ exec >"$FIFO"; sleep 2; ps -f ;echo "hello from $FIFO" ;} &
var=$(< "$FIFO")
rm "$FIFO"
echo "$var"
 
VARIABLE=`cat $TMPFIFO`
rm $TMPFIFO

# temp to subshell 
TMPF="/tmp/tmpf.$$"
mktemp $TMPF >/dev/null

(echo 'value' > $TMPF)

VARIABLE=`cat $TMPF`
echo $VARIABLE
rm $TMPF



#proc to var
coproc TEST { sleep 2; ps -f ;echo "hello from coproc" ;}
var=$(cat <&${TEST[0]})
echo "$var"

#
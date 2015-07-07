#!/bin/bash

module_ssh() {
    # ssh
    # ssh file transfers

    #
    #
    #
    ssh.main() {
        local CMD=$1
        local DIRECTION=$2
        local LOCAL_PATH=$3
        local LOCAL_FILE=$4
        local PROJECT_NAME=$5
        local REMOTE_PATH=$6
        local REMOTE_FILE=$7
        local REMOTE_USER=$8
        local REMOTE_ADDRESS=$9

        if [[ $DIRECTION == download ]]; then
            $($CMD $REMOTE_USER@$REMOTE_ADDRESS:$REMOTE_PATH/$PROJECT_NAME/$REMOTE_FILE $LOCAL_PATH/$PROJECT_NAME/$LOCAL_FILE)
        fi  
        if [[ $DIRECTION == upload ]]; then
            $($CMD $LOCAL_PATH/$PROJECT_NAME/$LOCAL_FILE $REMOTE_USER@$REMOTE_ADDRESS:$REMOTE_PATH/$PROJECT_NAME/$REMOTE_FILE)
        fi  
    }

    #
    #
    #
    ssh.ssh() {
        local CMD=rsync -rz --progress
        ssh.main $CMD $1 $2 $3 $4 $5 $6 $7 $8 
    }

    #
    #
    #
    ssh.scp() {
        local CMD=scp
        ssh.main $CMD $1 $2 $3 $4 $5 $6 $7 $8 
    }
}

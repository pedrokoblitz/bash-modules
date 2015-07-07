#!/bin/bash

module_aws() {
    aws.ec2_main_sync() {
        local REMOTE_USER=$1
        local REMOTE_ADDRESS=$2
        local REMOTE_PATH=$3
        local LOCAL_PATH=$4
        local DIRECTION=$5

        if [[ $DIRECTION -eq "upload" ]]; then
            sudo rsync -PazSHAX --rsh "ssh -i "$AWS_ACCESS_KEYS --rsync-path "sudo rsync" $LOCAL_PATH"/*"  $REMOTE_USER"@"$REMOTE_ADDRESS":"$REMOTE_PATH"/"
        elif [[ $DIRECTION -eq "download" ]]; then
            sudo rsync -PazSHAX --rsh "ssh -i /home/dev/aws/keys/chave3rstudio.pem" --rsync-path "sudo rsync" $REMOTE_USER"@"$REMOTE_ADDRESS":"$REMOTE_PATH"/*" $LOCAL_PATH"/"
        fi

    }

    aws.s3_main_sync() {
        local PATH=$3
        local S3NAME=$4

        boto-rsync -a$AWS_ACCESS_KEY_ID -s$AWS_SECRET_ACCESS_KEY -n $PATH s3://$S3NAME/
    }
}

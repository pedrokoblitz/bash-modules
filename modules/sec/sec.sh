#!/bin/bash

module_sec() {

    # security
    # ssh keys generation, backup and restore
    #--> ssh-keyscan <Server_Hostname_or_ip_address> >> ~/.ssh/known_hosts
    
    #
    # create keys
    #
    sec.generate_key_pair() {
        local $KEYRING=$1
        ssh-keygen -t rsa
        cat keypair >> $USER_HOME/.ssh/authorized_keys
    }

    #
    # create keys dir
    #
    sec.create_keyring_dir() {
        local KEYRING_DIR=$PROG_DIR/keyring/$KEYRING/
        if ! [[ -d $KEYRING_DIR ]]; then
            fs.mkdir $KEYRING_DIR
        fi 
    }

    #
    # create keys with email as username and password
    #
    sec.generate_protected_key_pair() {
        local $EMAIL=$1
        local $PASSWORD=$2
        local $KEYRING=$1
        ssh-keygen -t rsa -C $EMAIL
        backup_keys $KEYRING
    }

    #
    # check keys dir
    #
    sec.check_keyring_dir() {
        if ! [[ -d $SSH_KEYS_BACKUP_DIR ]]; then
            fs.mkdir $SSH_KEYS_BACKUP_DIR
        fi
    }

    #
    # save copies
    #
    sec.backup_keys() {
        local KEYRING=$1
        cp $SSH_KEYS_DIR/* $SSH_KEYS_BACKUP_DIR/$KEYRING/
    }

    #
    # restore copies
    #
    sec.restore_keys() {
        local KEYRING=$1
        cp $SSH_KEYS_BACKUP_DIR/$KEYRING/* $SSH_KEYS_DIR/
    }

    #
    # copy key to remove server
    #
    sec.enable_key_in_server() {
        local USERNAME=$1
        local SERVER_ADDRESS=$2
        ssh-copy-id $USERNAME@$SERVER_ADDRESS
    }

    #
    # allow root ssh login
    #
    sec.enable_root_ssh() {
        
    }

    #
    # forbid root ssh login
    #
    sec.disable_root_ssh() {

    }
}

module_sec

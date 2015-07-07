#!/bin/bash

module_sec() {

    # security
    # ssh keys generation, backup and restore
    #--> ssh-keyscan <Server_Hostname_or_ip_address> >> ~/.ssh/known_hosts
    
    #
    #
    #
    sec.generate_key_pair() {
        local $KEYRING=$1
        ssh-keygen -t rsa
        cat keypair >> $HOME"/.ssh/authorized_keys"
    }

    #
    #
    #
    sec.create_keyring_dir() {
        local KEYRING_DIR=$APP_DIR"/keyring/"$KEYRING"/"
        if ! [[ -d $KEYRING_DIR ]]; then
            fs.mkdir $KEYRING_DIR
        fi 
    }

    #
    #
    #
    sec.generate_protected_key_pair() {
        local $EMAIL=$1
        local $PASSWORD=$2
        local $KEYRING=$1
        ssh-keygen -t rsa -C $EMAIL
        backup_keys $KEYRING
    }

    #
    #
    #
    sec.generate_github_key_pair() {
        local $KEYRING='github'
        local $EMAIL=$1
        local $PASSWORD=$2
        generate_protected_key_pair $KEYRING
    }

    #
    #
    #
    sec.check_backup_dir() {
        if ! [[ -d $SSH_KEYS_BACKUP_DIR ]]; then
            fs.mkdir $SSH_KEYS_BACKUP_DIR
        fi
    }

    #
    #
    #
    sec.backup_keys() {
        local KEYRING=$1
        cp $SSH_KEYS_DIR"*" $SSH_KEYS_BACKUP_DIR"/"$KEYRING"/"
    }

    #
    #
    #
    sec.restore_keys() {
        local KEYRING=$1
        cp $SSH_KEYS_BACKUP_DIR$KEYRING"/*" $SSH_KEYS_DIR"/"
    }
}

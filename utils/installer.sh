#!/bin/bash

module_installer() {

    #
    #
    #
    installer.create_dir() {
        fs.create_dir_if_needed $USER_HOME/.${PROG}
    }

    #
    #
    #
    installer.create_temp_dir() {
        fs.create_dir_if_needed $USER_HOME/.${PROG}/tmp
    }

    #
    #
    #
    installer.cp_to_bin() {
        local SCRIPT=$PROG_DIR/$PROG
        fs.executable_permission $SCRIPT
        fs.cp $SCRIPT /user/local/bin/
    }
}

module_installer

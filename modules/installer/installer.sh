#!/bin/bash

module_installer() {

    #
    #
    #
    installer.create_dir() {
        fs.create_dir_if_needed $PROG_DIR
    }

    #
    #
    #
    installer.create_temp_dir() {
        fs.create_dir_if_needed $PROG_TEMP_DIR
    }

    #
    #
    #
    installer.cp_to_bin() {
        local SCRIPT=$PROG_DIR/$PROG
        fs.executable_permission $SCRIPT
        fs.cp $SCRIPT /user/local/bin/
    }

    installer.compile() {
        local SCRIPT_NAME=$1
        shc -r -f $SCRIPT_NAME.sh && chmod +x $SCRIPT_NAME.sh.x && mv $SCRIPT_NAME.sh.x $SCRIPT_NAME && rm $SCRIPT_NAME.sh.x.c
    }
}

module_installer

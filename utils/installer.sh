#!/bin/bash

module_installer() {

    #
    #
    #
    installer.create_dir() {
        fs.create_dir_if_needed $HOME"/."$APP
    }

    #
    #
    #
    installer.create_tmp_dir() {
        fs.create_dir_if_needed $HOME"/."$APP"/tmp"
    }

    #
    #
    #
    installer.cp_to_bin() {
        local SCRIPT=$PROGDIR"/"$APP
        fs.executable_permission $SCRIPT
        fs.cp $SCRIPT /user/local/bin/
    }
}

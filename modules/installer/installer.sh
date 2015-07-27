#!/bin/bash

module_installer() {

    # this module needs root/sudoer permission
    #
    if [ "$EUID" -ne 0 ]
      then echo "Please run as root"
      exit
    fi

    # create user dir for script if it does not exist
    #
    installer.create_dir() {
        fs.create_dir_if_needed $PROG_DIR
    }

    # create temporary dir for script if it does not exist
    #
    installer.create_temp_dir() {
        fs.create_dir_if_needed $PROG_TEMP_DIR
    }

    # creates user and adds it to sudoers list
    #
    installer.add_user() {
        local USERNAME=$1
        adduser $USERNAME
        gpasswd -a $USERNAME sudo
    }

    # make script executable and copy to /usr/local/bin
    #
    installer.cp_to_bin() {
        local SCRIPT=$PROG_DIR/$PROG
        fs.executable_permission $SCRIPT
        fs.cp $SCRIPT /usr/local/bin/
    }

    #
    #
    installer.compile() {
        local SCRIPT_NAME=$1
        shc -r -f ${SCRIPT_NAME}.sh && chmod +x ${SCRIPT_NAME}.sh.x && mv ${SCRIPT_NAME}.sh.x $SCRIPT_NAME && rm ${SCRIPT_NAME}.sh.x.c
    }
}

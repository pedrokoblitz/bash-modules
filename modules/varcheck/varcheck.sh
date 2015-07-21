#!/bin/bash

module_varcheck() {

    #
    # empty
    #
	varcheck.is_empty() {
	    local var=$1
	    [[ -z $var ]]
	}

    #
    # not empty
    #
	varcheck.is_not_empty() {
	    local var=$1
	    [[ -n $var ]]
	}
}

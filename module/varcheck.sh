#!/bin/bash

module_varcheck() {

    #
    #
    #
	varcheck.is_empty() {
	    local var=$1
	    [[ -z $var ]]
	}

    #
    #
    #
	varcheck.is_not_empty() {
	    local var=$1
	    [[ -n $var ]]
	}

    #
    #
    #
	varcheck.is_defined() {
	    local var=$1
	    is_not_empty $var
	}

    #
    #
    #
	varcheck.is_not_defined() {
	    local var=$1
	    is_empty $var
	}
}

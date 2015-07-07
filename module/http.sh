#!/bin/bash

module_http() {

    # http operations
    # get & post / rest / downloads

    #
    #
    #
    http.echo() {
        local URL=$1
        wget -o /dev/null -O $URL # ou wget -qO- http://example.com
    }

    #
    #
    #
    http.download() {
        local URL=$1
        local NAME=$2
        wget -O $NAME $URL
    }

    #
    #
    #
    http.get() {
        local URL=$1
        curl -L --request GET $URL
    }

    #
    #
    #
    http.post() {
        local URL=$1
        local DATA=$2
        curl --request POST $URL -d $DATA
    }

    #
    #
    #
    http.rest_get() {
        local URL=$1
        curl -i -H "Accept: application/json" -X GET $URL
    }

    #
    #
    #
    http.rest_post() {
        local URL=$1
        local DATA=$2
        curl -i -H "Accept: application/json" -X POST -d $DATA $URL
    }

    #
    #
    #
    http.rest_put() {
        local URL=$1
        local DATA=$2
        curl -i -H "Accept: application/json" -X PUT -d $DATA $URL
    }

    #
    #
    #
    http.rest_delete() {
        local URL=$1
        local DATA=$2
        curl -i -H "Accept: application/json" -X DELETE $URL
    }

    # http auth
    # curl -u username:password URL
    # follow redirect
    # curl -L http://www.google.com
}

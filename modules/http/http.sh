#!/bin/bash

module_http() {

    # http operations
    # get & post / rest / downloads

    # 
    # echo url output to stdout
    #
    http.echo() {
        local URL=$1
        wget -o /dev/null -O $URL # ou wget -qO- http://example.com
    }

    #
    # download url to file
    #
    http.download() {
        local URL=$1
        local NAME=$2
        wget -O $NAME $URL
    }

    #
    # get request
    #
    http.get() {
        local URL=$1
        curl -L --request GET $URL
    }

    #
    # post request
    #
    http.post() {
        local URL=$1
        local DATA=$2
        curl --request POST $URL -d $DATA
    }

    #
    # get request in json
    #
    http.rest_get() {
        local URL=$1
        curl -i -H "Accept: application/json" -X GET $URL
    }

    #
    # post request in json
    #
    http.rest_post() {
        local URL=$1
        local DATA=$2
        curl -i -H "Accept: application/json" -X POST -d $DATA $URL
    }

    #
    # put request in json
    #
    http.rest_put() {
        local URL=$1
        local DATA=$2
        curl -i -H "Accept: application/json" -X PUT -d $DATA $URL
    }

    #
    # delete request in json
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

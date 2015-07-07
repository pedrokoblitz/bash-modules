#!/bin/bash

module_string() {

    #
    #
    #
    string.column() {
        local column=$1
        local input
        IFS=
        read -r input
        echo "$input" \
            | awk "{print \$$column}"
    }

    #
    #
    #
    string.split_by() {
        local delimiter=$1
        local column=$2
        REPLY=$3
        [[ -z $REPLY ]] \
            && IFS= read -r
        echo "$REPLY" \
            | awk -F$delimiter "{print \$$column}"
    }

    #
    #
    #
    string.csv_column() {
        local column=$1
        IFS= read -r
        echo "$REPLY" \
            | cut -d ',' -f $column
    }

    #
    #
    #
    string.colons_to_spaces() {
        IFS= read -r
        echo "$REPLY" \
            | sed 's/:/ /g'
    }

    #
    #
    #
    string.eol_to_spaces() {
        IFS= 
        while read -r
        do
            echo "$REPLY" \
                | tr '\n' ' '
        done \
            | delete_edge_spaces
    }

    #
    #
    #
    string.delete_spaces() {
        IFS= read -r
        echo "$REPLY" \
            | sed 's/ //g'
    }

    #
    #
    #
    string.truncate_duplicate_spaces() {
        IFS= read -r
        echo "$REPLY" \
            | sed 's/[ ][ ]*/ /g'
    }

    #
    #
    #
    string.apostrophes_to_spaces() {
        IFS= read -r
        echo "$REPLY" \
            | sed s/"'"/" "/g
    }

    #
    #
    #
    string.commas_to_spaces() {
        IFS= read -r
        echo "$REPLY" \
            | sed 's/,/ /g'
    }

    #
    #
    #
    string.tabs_to_spaces() {
        IFS= read -r
        echo "$REPLY" \
            | sed 's/[\t]/ /g'
    }

    #
    #
    #
    string.delete_edge_spaces() {
        IFS= read -r
        echo "$REPLY" \
            | sed 's/^[ ][ ]*//' \
            | sed 's/[ ][ ]*$//'
    }

    #
    #
    #
    string.string_inside_quotes() {
        IFS= read -r
        echo "$REPLY" \
            | sed 's/.*"\(.*\)".*/\1/'
    }

    # string date
    # common bash date operations
    #
    string.default_date_delimiter() {
        echo '.'
    }

    #
    #
    #
    string.date_str() {
        local delimiter=${1:-$(string.default_date_delimiter)}
        date +%Y${delimiter}%m${delimiter}%d
    }

    #
    #
    #
    string.time_str() {
        local delimiter=${1:-$(string.default_date_delimiter)}
        date +%H${delimiter}%M
    }

    #
    #
    #
    string.time_with_seconds_str() {
        local delimiter=${1:-$(string.default_date_delimiter)}
        date +%H${delimiter}%M${delimiter}%S
    }

    #
    #
    #
    string.date_time_str() {
        local delimiter=${1:-$(string.default_date_delimiter)}
        local hour_delimiter=${2:-"-"}
        echo $(date_str $delimiter)${hour_delimiter}$(time_str $delimiter)
    }

    #
    #
    #
    string.date_time_with_seconds_str() {
        local delimiter=${1:-$(string.default_date_delimiter)}
        local hour_delimiter=${2:-"-"}
        echo $(date_str $delimiter)${hour_delimiter}$(time_with_seconds_str $delimiter)
    }
}

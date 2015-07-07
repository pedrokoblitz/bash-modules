#!/bin/bash

module_queue() {


    # fs
    # queue management

    readonly QUEUE_FILE=""
    readonly QUEUE_TYPE="<fifo|filo>"

    #
    #
    #
    queue.add_first() {
        local QUEUE=$1
        local MESSAGE=$2
        fs.prepend_line_to_file $QUEUE $MESSAGE
    }

    #
    #
    #
    queue.add_last() {
        local QUEUE=$1
        local MESSAGE=$2
        fs.append_line_to_file $QUEUE $MESSAGE
    }

    #
    #
    #
    queue.get_first() {
        local QUEUE=$1
        text_get_first_line_from_file $QUEUE
    }

    #
    #
    #
    queue.get_last() {
        local QUEUE=$1
        text_get_last_line_from_file $QUEUE
    }

    #
    #
    #
    queue.get() {
        local QUEUE=$1
        QUEUE_COUNT=$(queue.count $1)

        if [[ $QUEUE_COUNT -gt 0 ]]; then
            if [[ $QUEUE_TYPE -eq filo ]]; then
                queue.get_last $QUEUE && queue.remove_last $QUEUE
            elif  [[ $QUEUE_TYPE -eq fifo ]]; then
                queue.get_first $QUEUE && queue.remove_first $QUEUE
            fi
        fi
    }

    #
    #
    #
    queue.remove_first() {
        local QUEUE=$1
        tail -n +2 QUEUE
    }

    #
    #
    #
    queue.remove_last() {
        local QUEUE=$1
        truncate -s -"$(queue.get_last $QUEUE | wc -c)" $QUEUE
    }

    #
    #
    #
    queue.clear() {
        local QUEUE=$1
        echo /dev/null > $QUEUE
    }

    #
    #
    #
    queue.count() {
        local QUEUE=$1
        fs.count $QUEUE
    }
}

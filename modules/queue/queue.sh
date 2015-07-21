#!/bin/bash

module_queue() {


    # fs
    # queue management

    #
    # add item to beggining of queue
    #
    queue.add_first() {
        local QUEUE=$1
        local MESSAGE=$2
        fs.prepend_line_to_file $QUEUE $MESSAGE
    }

    #
    # add item to end of queue
    #
    queue.add_last() {
        local QUEUE=$1
        local MESSAGE=$2
        fs.append_line_to_file $QUEUE $MESSAGE
    }

    #
    # get first item
    #
    queue.get_first() {
        local QUEUE=$1
        text_get_first_line_from_file $QUEUE
    }

    #
    # get last item
    #
    queue.get_last() {
        local QUEUE=$1
        text_get_last_line_from_file $QUEUE
    }

    #
    # get item for queue type
    #
    queue.get() {
        local QUEUE=$1
        local QUEUE_TYPE=$2
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
    # remove first item 
    #
    queue.remove_first() {
        local QUEUE=$1
        tail -n +2 QUEUE
    }

    #
    # remove last item
    #
    queue.remove_last() {
        local QUEUE=$1
        truncate -s -"$(queue.get_last $QUEUE | wc -c)" $QUEUE
    }

    #
    # clear queue
    #
    queue.clear() {
        local QUEUE=$1
        echo /dev/null > $QUEUE
    }

    #
    # get queue length
    #
    queue.count() {
        local QUEUE=$1
        fs.count $QUEUE
    }
}

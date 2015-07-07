#!/bin/bash

_cron() {

    # applib
    # cron

    # @reboot Run once, at startup.
    # @yearly Run once a year, "0 0 1 1 *".
    # @annually (same as @yearly)
    # @monthly Run once a month, "0 0 1 * *".
    # @weekly Run once a week, "0 0 * * 0".
    # @daily Run once a day, "0 0 * * *".
    # @midnight (same as @daily)
    # @hourly Run once an hour, "0 * * * *".

    readonly DEFAULT_APP_PATH="/usr/local/bin"

    cron.add_job() {

        local NEW_CRON=$1
        local JOB=$2
        local APP=$3

        crontab -l > mycron
        echo $JOB" "$DEFAUlT_APP_PATH"/"$APP >> mycron
        crontab mycron

        fs.rm mycron
    }

    cron.remove_job() {

        local NEW_CRON=$1
        local JOB=$2
        local APP=$3
    }
}

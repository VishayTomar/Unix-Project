#!/bin/sh

# default values
delay=""
time=""
command=""

# function to explain the usage of the scheduler
usage(){
        echo "Usage: $0 -d <delay_seconds> <command>"
        echo "   or: $0 -t <HH:MM> <command>"
        exit 1
}

# no argument = show usage
[ $# -lt 2 ] && usage

# parse flags
case "$1" in
    -d)
        delay="$2"
        shift 2
        command="$@"
        echo "Scheduling command '$command' after $delay seconds..."
        sleep "$delay"
        eval "$command"
        ;;

    -t)
        time="$2"
        shift 2
        command="$@"

        # convert HH:MM to seconds since midnight
        hour=$(echo "$time" | cut -d: -f1)
        min=$(echo "$time" | cut -d: -f2)
        target_sec=$((10#$hour * 3600 + 10#$min * 60))

        # current seconds since midnight
        cur_hour=$(date +%H)
        cur_min=$(date +%M)
        cur_sec=$(date +%S)
        current_sec=$((10#$cur_hour * 3600 + 10#$cur_min * 60 + 10#$cur_sec))

        wait=$((target_sec - current_sec))
        [ $wait -lt 0 ] && wait=$((wait + 86400))

        echo "Scheduling command '$command' at $time (wait $wait seconds)..."
        sleep "$wait"
        eval "$command"
        ;;

    *)
        usage
        ;;
esac

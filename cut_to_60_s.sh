#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script cuts a video at 60s

Usage: $0 <inputfile> 
EndOfMessage
)


if [ $# -lt 2 ];then
    echo "Insufficient arguments:"
    echo "${HELP}"
    exit 1
fi

INPUT_FILE=$1
INPUT_EXTENSIONLESS=${INPUT_FILE%.*$}
EXTENSION="${INPUT_FILE##*.}"

ffmpeg -ss 00:00:0.0 -i ${INPUT_FILE} -c copy -t 00:00:59.95 ${INPUT_EXTENSIONLESS}_cut.${EXTENSION}

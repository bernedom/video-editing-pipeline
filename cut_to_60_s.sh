#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script cuts a video at 60s

Usage: $0 <inputfile> <start_in_seconds> <duration_in_seconds>
EndOfMessage
)


if [ $# -lt 3 ];then
    echo "Insufficient arguments:"
    echo "${HELP}"
    exit 1
fi

set -x
INPUT_FILE=$1
START=$2
duration=$3
INPUT_EXTENSIONLESS=${INPUT_FILE%.*}
EXTENSION="${INPUT_FILE##*.}"

ffmpeg -ss ${START} -i ${INPUT_FILE} -c copy -t ${duration} ${INPUT_EXTENSIONLESS}_cut.${EXTENSION}

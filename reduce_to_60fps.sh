#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script reduces a high-fps video to 60fps

Usage: $0 <inputfile>
EndOfMessage
)


if [ $# -lt 1 ];then
    echo "Insufficient arguments:"
    echo "${HELP}"
    exit 1
fi

INPUT_FILE=$1
INPUT_EXTENSIONLESS=${INPUT_FILE%.*}
EXTENSION="${INPUT_FILE##*.}"

ffmpeg -ss 00:00:00.0 -y -i ${INPUT_FILE} -r 60 -t 00:00:59.95 ${INPUT_EXTENSIONLESS}_60fps.${EXTENSION}

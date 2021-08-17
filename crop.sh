#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script crops a video to a width of 500px

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

ffmpeg -i ${INPUT_FILE} -filter:v "crop=in_w-500:in_h" -c:a copy ${INPUT_EXTENSIONLESS}_cropped.${EXTENSION}


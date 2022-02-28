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

ffmpeg -i ${INPUT_FILE} -vf "scale=640:425:force_original_aspect_ratio=decrease,pad=640:425:0:0,setsar=1" -c:a copy ${INPUT_EXTENSIONLESS}_border.${EXTENSION}


#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script replaces the audio track of a video

Usage: $0 <inputfile> <audiofile>
EndOfMessage
)


if [ $# -lt 2 ];then
    echo "Insufficient arguments:"
    echo "${HELP}"
    exit 1
fi

INPUT_FILE=$1
AUDIO_FILE=$2
INPUT_EXTENSIONLESS=${INPUT_FILE%.*}
EXTENSION="${INPUT_FILE##*.}"

ffmpeg -i ${INPUT_FILE} -i ${AUDIO_FILE} -c:v copy -map 0:v:0 -map 1:a:0 ${INPUT_EXTENSIONLESS}_replaced_audio.${EXTENSION}

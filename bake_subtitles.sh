#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script bakes subtitles into a video.

Usage: $0 <inputfile> <subtitles.ass>
EndOfMessage
)


if [ $# -lt 2 ];then
    echo "Insufficient arguments:"
    echo "${HELP}"
    exit 1
fi

INPUT_FILE=$1
SUBTITLE_FILE=$2
INPUT_EXTENSIONLESS=${INPUT_FILE%.*$}
EXTENSION="${INPUT_FILE##*.}"

ffmpeg -i ${INPUT_FILE} -vf "ass=${SUBTITLE_FILE}" ${INPUT_EXTENSIONLESS}_subtitles.${EXTENSION}

#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script applies a bandpass-filter to the audio stream

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


ffmpeg -i ${INPUT_FILE} -af "highpass=f=200, lowpass=f=3000" ${INPUT_EXTENSIONLESS}_filtered.${EXTENSION}

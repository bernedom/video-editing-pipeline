#!/bin/bash
SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script speeds up the video by 10%

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

ffmpeg -i ${INPUT_FILE} -filter_complex "[0:v]setpts=0.9*PTS[v];[0:a]atempo=1.100[a]" -map "[v]" -map "[a]" ${INPUT_EXTENSIONLESS}_speedup.${EXTENSION}


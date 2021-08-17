#!/bin/bash
SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script speeds up the video by 10% smoothly

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

ffmpeg -i ${INPUT_FILE} -filter:v "minterpolate='mi_mode=mci:mc_mode=aobmc:vsbmc=1:fps=30'" ${INPUT_EXTENSIONLESS}_smooth.${EXTENSION}


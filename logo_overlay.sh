#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script puts a logo in the top left corer of a video

Usage: $0 <inputfile> <logofile>
EndOfMessage
)


if [ $# -lt 2 ];then
    echo "Insufficient arguments:"
    echo "${HELP}"
    exit 1
fi

INPUT_FILE=$1
LOGO_FILE=$2
INPUT_EXTENSIONLESS=${INPUT_FILE%.*}
EXTENSION="${INPUT_FILE##*.}"

ffmpeg -i ${INPUT_FILE} -i ${LOGO_FILE} \
-filter_complex "[0:v][1:v] overlay=25:25:enable='between(t,0,60)'" \
-pix_fmt yuv420p -c:a copy \
${INPUT_EXTENSIONLESS}_logo.${EXTENSION}

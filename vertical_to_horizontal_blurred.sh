#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")/../"; pwd -P )"

HELP=$(
    cat <<EndOfMessage
This script puts a smaller video in a 16:9 format and surrounds it with a blurred background

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


ffmpeg -i ${INPUT_FILE} -filter_complex \
'[0:v]scale=ih*16/9:-1,boxblur=luma_radius=min(h\,w)/20:luma_power=1:chroma_radius=min(cw\,ch)/20:chroma_power=1[bg];[bg][0:v]overlay=(W-w)/2:(H-h)/2,crop=h=iw*9/16' \
${INPUT_EXTENSIONLESS}_blurred_background.${EXTENSION}

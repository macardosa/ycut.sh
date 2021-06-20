#!/bin/bash

convert_to_second () {
    str=$1
    opr=""
    fct=1
    sum=0
    while [[ $str != $opr ]];
    do
        opr=${str##*:}
        str=${str%:*}
        sum=$((sum+fct*opr))
        fct=$((fct*60))
    done
    echo $sum
}

if [[ -z $1 ]]; then
    echo "You need to provide an URL. Nothing to doo ..."
    exit
elif [[ "-h" =~ "$1" ]]; then
    echo -e "\tThis bash script downloads a video from youtube with the"
    echo -e "\tprovided link, or, if -t flag is specified, only the time"
    echo -e "\tportion specified is saved"
    echo "USAGE"
    echo -e "\tycut.sh link_of_video -t hh:mm:ss-hh:mm:ss -f fileformat"
    echo "INPUT"
    echo -e "\tThe link of the video (MANDATORY)"
    echo -e "\tThe portion of the video to trim (OPTIONAL)"
    echo -e "\tThe output format (i.e. mp3, mpeg, mp4, flv ...) for the clip (OPTIONAL)"
    echo "OUTPUT"
    echo -e "\tA file _cut.fmt is created, where fmt is the format if it has"
    echo -e "\tbeen specified; otherwise the default mp4 is used."
    echo -e "\tIf -t option is not specified (not trimming), a file _out.mp4 is"
    echo -e "\tcontaining the whole video."
    exit
 fi

youtube-dl --no-progress --no-warnings --quiet --output _out $1

 if [[ "-t" =~ "$2" ]]; then
    if [[ -z $3 ]]; then
         echo "Full video downloaded. Time range not provided. See help: ycut -h"
    else
        ini=$(convert_to_second ${3%-*})
        end=$(convert_to_second ${3#*-})
        dt=$((end-ini))

        if [[ -n $4 && $4 == '-f' && -n $5 ]]; then
            ffmpeg -ss $ini -i _out.mp4 -t $dt -f $5 _cut.$5 -y\
                -hide_banner -loglevel error
        else
            ffmpeg -ss $ini -i _out.mp4 -t $dt -c copy _cut.mp4 -y \
                -hide_banner -loglevel error
        fi
        rm _out.*
     fi
 fi

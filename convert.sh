#!/bin/bash

if [[ $1 ]]
then
    filename=$(basename "$1")
    filename=${filename%.*}
    directory=$(dirname "$1")

    duration=$(ffmpeg -i "$1" 2>&1 | grep Duration | awk '{print $2}' | tr -d ,)
    minutes=${duration%:*}
    hours=${minutes%:*}
    minutes=${minutes##*:}
    seconds=${duration##*:}
    seconds=${seconds%.*}

    echo "Duration: $duration"

    #hours=$((hours*3600))
    #minutes=$((minutes*60))

    #total=$(expr $hours + $minutes + $seconds)
    #number=$RANDOM
    #let "number %= $total"

    #echo "Generating thumbnail"
    #ffmpeg -i "$1" -deinterlace -an -ss $number -t 00:00:01 -r 1 -y -vcodec mjpeg -f mjpeg "$directory/$filename.jpg" 2>&1
    #echo "Converting $filename to ogv"
    #ffmpeg -i "$1" -acodec libvorbis -ac 2 -ab 96k -ar 44100 -b 345k "$directory/$filename.ogv"
    #echo "Finished ogv"

    #echo "Converting $filename to webm"
    #ffmpeg -i "$1" -acodec libfaac -ac 2 -ab 256k -ar 44100 -b 345k "$directory/$filename.webm"
    #echo "Finished webm"

    echo "Converting $filename to h264"
    ffmpeg -i "$1" -acodec libfaac -ab 256k -vcodec libx264 -level 21 -refs 2 -b 690k -bt 690k -threads 0 "$directory/$filename.mp4"
    echo "Finished h264"

    echo "All Done!"
else
    echo "Usage: [filename]"
fi
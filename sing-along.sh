#! /bin/bash
artist=`osascript -e 'tell application "iTunes" to artist of current track as string'`;
title=`osascript -e 'tell application "iTunes" to name of current track as string'`;

SERVER="http://sing-along.herokuapp.com/lyrics"

OPTS="-s -G -A 'Sing-along agent'"
DATA="--data-urlencode \"artist=${artist}\" --data-urlencode \"title=${title}\""

output=`eval curl $OPTS $SERVER $DATA` > /dev/null
echo -e $output | less

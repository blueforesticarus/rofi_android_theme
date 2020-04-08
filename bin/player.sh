#!/bin/bash
LINES=6
source `dirname $0`/common.sh

stat="$(playerctl status -f "{{status}},{{loop}},{{shuffle}}")"
S_PLAY="$(echo "$stat" | cut -d ',' -f1)"
S_LOOP="$(echo "$stat" | cut -d ',' -f2)"
S_SHUF="$(echo "$stat" | cut -d ',' -f3)"

play_pause=""
tog_repeat=""
tog_random=""
stop=""
next=""
previous=""

if [[ "$S_PLAY" == "Playing" ]]; then
    play_pause=""
fi

active=""
urgent=""

# Display if repeat mode is on / off
if [ "$S_LOOP" == "Playlist" ]; then
    urgent="-u 4"
    val_repeat="Track"
elif [ "$S_LOOP" == "Track" ]; then
    active="-a 4"
    val_repeat="Playlist"
elif [ "$S_LOOP" == "None" ]; then
    urgent="-u 4"
    val_repeat="Track"
else
    tog_repeat=""
fi

if [ "$S_SHUF" == "false" ]; then
    [ -n "$urgent" ] && urgent+=",5" || urgent="-u 5"
    val_random="On"
elif [ "$S_SHUF" == "true" ]; then
    [ -n "$active" ] && active+=",5" || active="-a 5"
    val_random="Off"
else
    tog_random=""
fi

# Variable passed to rofi
OPT="$previous\n$play_pause\n$stop\n$next\n$tog_repeat\n$tog_random"
RET="$( ROFI "$OPT" 1 $urgent $active )"
case $RET in
    $previous)
        playerctl previous
        ;;
    $play_pause)
        playerctl play-pause
        ;;
    $stop)
        playerctl stop
        ;;
    $next)
        playerctl next
        ;;
    $tog_repeat)
        playerctl loop $val_repeat
        ;;
    $tog_random)
        playerctl shuffle $val_random
        ;;
esac

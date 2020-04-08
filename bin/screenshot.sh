#!/bin/bash
LINES=3
source `dirname $0`/common.sh

# Options
screen=""
area=""
window=""

# Variable passed to rofi
OPT="$screen\n$area\n$window"
RET="$( ROFI "$OPT" "1" )"

case $RET in
    $screen)
        sleep .5 && screenshot
        ;;
    $area)
        screenshot -s
        ;;
    $window)
        sleep .5 && screenshot -u
        ;;
esac


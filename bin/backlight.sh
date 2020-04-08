#!/usr/bin/env bash
#!/bin/bash
LINES=3
source `dirname $0`/common.sh

## Icons
ICON_UP=""
ICON_DOWN=""
ICON_OPT=""

OPT="$ICON_UP\n$ICON_OPT\n$ICON_DOWN"
RET="$( ROFI "$OPT" "1" )"

case $RET in
    $ICON_UP)
        STEPS=2 dim 2
        exit
        ;;
    $ICON_DOWN)
        STEPS=2 dim 0 
        ;;
    $ICON_OPT)
        STEPS=2 dim 1 
        ;;
esac


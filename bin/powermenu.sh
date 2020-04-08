#!/bin/bash
LINES=5
source `dirname $0`/common.sh

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
OPT="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
RET="$( ROFI "$OPT" "2" )"

case $RET in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen -l blur --off 15
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        i3-msg exit
        ;;
esac


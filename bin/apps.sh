#!/bin/bash
LINES=6
source `dirname $0`/common.sh

# Links
terminal=""
files=""
editor=""
browser=""
music=""
settings=""

# Variable passed to rofi
OPT="$terminal\n$files\n$editor\n$browser\n$music\n$settings"
RET="$( ROFI "$OPT" "1" )"

case $RET in
    $terminal)
        launch -n kitty
        ;;
    $files)
        launch -n nautilus &
        ;;
    $editor)
        launch -n kitty vim ~&
        ;;
    $browser)
        launch -n firefox &
        ;;
    $music)
        launch -n kitty spt &
        ;;
    $settings)
        launch -n kitty bash -c 'yay -Q | xargs -I {} bash -c "cowthink {} && sleep 1"'
        ;;
esac


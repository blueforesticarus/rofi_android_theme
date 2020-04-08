#!/bin/bash
LINES=6
source `dirname $0`/common.sh

# Links
google=""
facebook=""
twitter=""
github=""
mail=""
youtube=""

# Variable passed to rofi
OPT="$google\n$facebook\n$twitter\n$github\n$mail\n$youtube"
RET="$( ROFI "$OPT" "1" )"

case $RET in
    $google)
        firefox --new-tab https://www.google.com
        ;;
    $facebook)
        firefox --new-tab https://www.facebook.com
        ;;
    $twitter)
        firefox --new-tab https://www.twitter.com
        ;;
    $github)
        firefox --new-tab https://www.github.com
        ;;
    $mail)
        firefox --new-tab https://www.gmail.com
        ;;
    $youtube)
        firefox --new-tab https://www.youtube.com
        ;;
esac


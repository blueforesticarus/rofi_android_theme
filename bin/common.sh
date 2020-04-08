CMD="rofi -config '' -theme android/main.rasi -theme-str *{num-lines:$LINES;}"

ROFI () {
    echo -e "$1" | $CMD -dmenu -selected-row ${@:2}
}


rofi android themed launchers 
adapted from [ad1090x's android rofi theme](https://github.com/adi1090x/rofi#android-style-sidemenus)
maintains same look as original but the code has been cleaned up, stylesheets now are all based on em rather than ps, you can just change the icon font size and the menu scales properly. Also ad1090x's repo is a clusterfuck IDK wtf is going on in there; this fork just has the android theme, adapted to work independantly

- you need my [tools](https://github.com/blueforesticarus/tools) for this to work out of the box, but it should be easy to adapt the scripts
- you also need to install the feather.ttf (put it in ~/.local/share/fonts and run fc-cache)
- clone this repo to ~/.config/rofi/android or symlink it there
- the menu scripts live in bin, just run them
- you CAN have config.rasi in ~/.config/rasi, these scripts will ignore it



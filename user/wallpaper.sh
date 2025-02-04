#!/bin/sh

# waits for hyprpaper to initialize
sleep 0.5s

wallpaper=$(shuf -e -n1 $HOME/nord-background/*)
loaded_output=$(hyprctl hyprpaper listloaded)
echo $wallpaper > $HOME/wallpaper.txt
if [[ $loaded_output != "no wallpapers loaded" ]]; then
	hyprctl hyprpaper unload all
fi
hyprctl hyprpaper preload $wallpaper
wall_with_monitor=",${wallpaper}"
hyprctl hyprpaper wallpaper $wall_with_monitor 

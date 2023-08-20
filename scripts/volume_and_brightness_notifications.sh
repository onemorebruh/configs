#!/usr/bin/bash bash


function volume_notify
set -l percent (amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1)
	notify-send -h int:value:$percent "󰝚"
end


function mute_notify
set -l percent (amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1)
set -l left (amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]' | string split -n 1)
	# i change value of left and right speaker toghether so the values have to be the same
	if test left = "[on]";
    notify-send -h int:value:$percent "󰝚"
	else
	  notify-send -h int:value:$percent "󰝛"
  end
end


function brightness_notify
  set -l value (brightnessctl g)
  set -l percent (math $value x 100 / 255)
	notify-send -h int:value:$percent "󰃞"
end

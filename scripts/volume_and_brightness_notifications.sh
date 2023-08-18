#!/bin/bash


function volume_notify(){
  percent=`amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1`
  `notify-send -h int:value:$percent "󰝚"`
}


function mute_notify(){
  percent=`amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1`
  left,right=`amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]'`
  # i change value of left and right speaker toghether so the values have to be the same
  if [[ "$left" == "[on]" ]]; then
    `notify-send -h int:value:$percent "󰝚"`
  else
    `notify-send -h int:value:$percent "󰝛"`
  fi
}


function brightness_notify(){
  value=`brightnessctl g`
  percent=`echo $((255 * 100 / 255))`
  `notify-send -h int:value:$percent "󰃞"`
}

#!/bin/bash

cd $HOME/configs 
cp -r $HOME/.config/i3/ .
cp -r $HOME/.config/i3status/ .
cp -r $HOME/.config/nvim/ .
cp -r $HOME/.config/fish/config.fish config.fish
cp -r $HOME/.config/dunst .
cp -r $HOME/.config/neofetch/ .
cp -r $HOME/.tmux.conf tmux.conf
cp -r $HOME/.tmux.conf.local tmux.conf.local
cp -r $HOME/.tmux/ .
cp -r /etc/startup/ .
cp $HOME/.alacritty.yml alacritty.yml

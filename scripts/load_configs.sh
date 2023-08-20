#!/bin/bash

# copy configs
cd $HOME/configs 
cp -r startup /etc/startup
cp -r wallpaper /etc/startup/wallpaper/ 
cp -r nvim $HOME/.config/
cp -r i3 $HOME/.config/
cp -r i3status $HOME/.config/
cp -r dunst $HOME/.config/ 
cp -r neofetch $HOME/.config/
cp -r tmux.conf $HOME/.tmux.conf
cp -r tmux.conf.local $HOME/.tmux.conf.local
cp -r tmux $HOME/.tmux/
cp alacritty.yml $HOME/.alacritty.yml
cp config.fish $HOME/.config/fish/config.fish

# clone dependencies

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd /tmp/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip

wget https://en.bestfonts.pro/fonts_files/5c6c85f830732d049e025422/font.zip #NOTE may not work
unzip font.zip

mv *.ttf /usr/share/fonts/ttf #TODO upgrade font with a nerd-fonts before installing

mv JetBrainsMono/JetBrains*.ttf /usr/share/fonts/ttf
fc-cache -vf

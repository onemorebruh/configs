#!/bin/bash

# copy configs
cd $HOME/configs 
cp -r nvim $HOME/.config/
cp -r i3 $HOME/.config/
cp -r i3status $HOME/.config/
cp alacritty.yml $HOME/.alacritty.yml
cp vimrc $HOME/.vimrc
cp config.fish $HOME/.config/fish/config.fish

# clone dependencies

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd /tmp/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip
mv JetBrainsMono/JetBrains*.ttf /usr/share/fonts/ttf
fc-cache -vf

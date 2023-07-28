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

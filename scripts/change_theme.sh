#!/usr/bin/sh

# Changing the theme of alacritty

/home/hemanth/alacritty-color-export/script.sh

# Changing the theme of ST
cd /media/data/Workspace/suckless/st
rm config.h
sudo make && sudo make clean install

# Changing the theme of DWM
cd /media/data/Workspace/suckless/dwm
rm config.h
sudo make && sudo make clean install

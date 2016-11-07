#!/bin/bash

# basic packages
sudo eopkg up -y
sudo eopkg it git fish python3 python3-devel neovim guake -y

# vim plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# pip upgrade
pip3 install --upgrade pip --user
pip3 install --upgrade pip --user
pip3 install --upgrade pip --user
pip3 install neovim --user
pip3 install rtv --user

mkdir ~/git
# Powerline Fonts
cd ~/git
git clone git@github.com:powerline/fonts.git
cd fonts/ && sh install.sh

# Swap escape and caps
setxkbmap -option caps:swapescape

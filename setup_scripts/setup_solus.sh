#!/bin/bash

# basic packages
sudo eopkg up -y
sudo eopkg it git fish neovim -y

sudo eopkg it $(eopkg sr -N libreoffice | cut -d" " -f 1 | tr '\n' ' ')

# chsh
chsh -s /usr/bin/fish

# vim plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Powerline Fonts
cd ~/git
git clone git@github.com:ryanoasis/nerd-fonts.git
cd nerd-fonts/ && sh install.sh


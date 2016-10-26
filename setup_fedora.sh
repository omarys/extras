#!/bin/bash
# basic packages
sudo dnf install fish gnome-tweak-tool git vim -y

# United RPM repo
'dnf -y install https://raw.githubusercontent.com/UnitedRPMs/unitedrpms/master/RPM/unitedrpms-24-2.noarch.rpm'

# Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Powerline Fonts
cd ~/git
git clone git@github.com:powerline/fonts.git
cd fonts/ && sh install.sh

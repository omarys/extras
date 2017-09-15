#!/bin/bash

# basic packages
sudo eopkg up -y
sudo eopkg it git fish python3 python3-devel neovim guake gnome-tweak-tool weechat xboxdrv -y

sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/solus-project/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml &&
sudo eopkg it google-chrome-*.eopkg && sudo rm  google-chrome-*.eopkg
sudo eopkg it $(eopkg sr -N libreoffice | cut -d" " -f 1 | tr '\n' ' ')

# chsh
sudo chsh -s /usr/bin/fish user

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
git clone git@github.com:ryanoasis/nerd-fonts.git
cd nerd-fonts/ && sh install.sh

# cp files
cd ~/git/dot_files
cp neovim_config.fish ~/.config/fish/config.fish
cp solus_alias.fish ~/.config/fish/alias.fish
cp ssh_config ~/.ssh/
cp vimrc ~/.config/nvim/init.vim

# Swap escape and caps
setxkbmap -option caps:swapescape

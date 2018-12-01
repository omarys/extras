#!/bin/bash

# basic packages
sudo eopkg up -y
sudo eopkg it git fish neovim -y

# chsh
chsh -s /usr/bin/fish

# vim plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Powerline Fonts
echo "downloading hack font from github"
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
mkdir -p ~/.local/share/fonts && mv 'Hack\ Regular\ Nerd\ Font\ Complete\ Mono.ttf' ~/.local/share/fonts



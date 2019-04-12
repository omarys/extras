#!/bin/bash

echo "installing third party repositories"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "installing git, fish, neovim, and firefox"
sudo dnf install git fish neovim yakuake

echo "changing shell for user"
#chsh -s /usr/bin/fish

echo "installing vim-plug for neovim"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "downloading hack font from github"
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
mkdir -p ~/.local/share/fonts && cp 'Hack\ Regular\ Nerd\ Font\ Complete\ Mono.ttf' ~/.local/share/fonts

echo "installing pip"
#curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python3 get-pip.py

pip install rtv --user
pip install pipenv --user
pip install ansible --user

#!/bin/bash

echo "installing git, fish, neovim, and pcsc tools"
sudo zypper install git fish neovim yakuake pcsc-lite pcsc-ccid pcsc-tools perl-pcsc opensc coolkey coolkey-devel

sudo systemctl enable pcscd
sudo systemctl restart pcscd

echo "changing shell for user"
chsh -s /usr/bin/fish

echo "installing vim-plug for neovim"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "adding flathub remote"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install org.keepassxc.KeepassXC -y
flatpak install org.discordapp.Discord -y

echo "installing fisher"
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/hydro

echo "generating ssh key"
ssh-keygen -t ed25519 -C "omaryscott@gmail.com"

echo "installing poetry"
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
poetry completions fish > ~/.config/fish/completions/poetry.fish

echo "installing pip packages"
pip install youtube-dl neovim --user

echo "linking pkcs library to vmware for cac auth"
sudo mkdir -p /usr/lib/vmware/view/pkcs11/
sudo ln -s /usr/lib64/pkcs11/libcoolkeypk11.so /usr/lib/vmware/view/pkcs11/libcoolkeypk11.so

sudo zypper in python python-xml python-curses

# don't forget:
#    add lines for pulling down vmware and teams, and running them.
#    install root certficates to system


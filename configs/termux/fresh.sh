#!/bin/sh

apt install wget
apt install curl
apt install neovim
apt install zellij
apt install yazi
apt install rust

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

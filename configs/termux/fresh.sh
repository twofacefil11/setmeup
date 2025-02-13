#!/bin/sh
echo "check if pkg update works first!"
p
pkg install git
pkg install wget
pkg install curl
pkg install neovim
pkg install zellij
pkg install yazi
pkg install rust

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

echo "Member to add lvim to path(its problematic)"A

echo "also termux-reset settings or something"
cp  .bashrc ~/
cp -r .config ~/
cp -r .termux ~/



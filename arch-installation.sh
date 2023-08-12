#!/bin/bash
# created by: tkaming

# variables
$username = "tobiask" 

# black arch mirrors
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
rm -rf strap.sh
sudo pacman -Syu

# packages
sudo pacman -Sy
sudo pacman -S flatpak flameshot python3 python-pip git 

# get my dotfiles
sudo git clone https://github.com/TKAMING/dotfiles/tree/main

# create my folder structure
cd
mkdir Downloads/
mkdir workflow/
cd workflow
mkdir dotfiles
cd ..
mkdir Documents/
cd Documents
mkdir comp/
cd comp
mkdir CF
cd ..
mkdir CTF/
cd

# move to .config
mkdir .config
cp -a dotfiles/. .config/

# backup my dotfiles
sudo chmod +x backup-dotfiles.sh
sudo ./backup-dotfiles.sh

# neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

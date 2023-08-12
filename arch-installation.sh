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
sudo pacman -S flatpak flameshot python3 python-pip git xrandr xdg-user-dirs

# get my dotfiles
sudo git clone https://github.com/TKAMING/dotfiles/tree/main

# create my folder structure
# using xdg-user-dirs
cd
xdg-user-dirs-update
mkdir workflow/
cd workflow
mkdir dotfiles
cd ..
cd Documents
mkdir comp/
cd comp
mkdir CF
cd ..
mkdir CTF/
cd

# move to .config
mkdir .config
cp -a dotfiles/i3 .config/
cp -a dotfiles/nvim .config/
cp -a dotfiles/polybar .config/
cp -a dotfiles/rofi .config/

# backup my dotfiles
sudo chmod +x backup-dotfiles.sh
sudo ./backup-dotfiles.sh

# neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

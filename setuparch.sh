#!/bin/bash

# My Arch setup script (base-devel is needed for this)

# Create used directories

mkdir -p /home/$USER/.config/bspwm /home/$USER/.config/sxhkd /home/$USER/.local/bin \
        /home/$USER/.local/wallpapers
 
# Download and install yay (its an aur manager)

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

cd .. # Go back to Dotfiles

# Install usefull software

yay -S zsh zsh-syntax-highlighting zsh-autosuggestions bat eza xorg xorg-devel bspwm sxhkd git nano \
         feh picom unclutter dmenu lxappearance ttf-hack-nerd xcursor-breeze google-chrome

# Install dotfiles

cp .xinitrc /home/$USER

cp .fehbg /home/$USER

cp .vimrc /home/$USER

cp .zshrc /home/$USER

cp bswpmrc /home/$USER/.config/bspwm

cp sxhkdrc /home/$USER/.config/sxhkd

cp landscape.jpg /home/$USER/.local/wallpapers

# setup wallpaper

feh --bg-scale /home/$USER/.local/wallpapers/landspace.jpg

# Install vim plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download and install zsh-colored-man-pages

bash install-zsh-colored-man-pages.sh

# Lastly setup my st build

cd st-0.8.4

make

sudo make install

cd /home/$USER

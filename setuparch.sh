#!/bin/bash

# My Arch setup script (base-devel is needed for this)

# Run this after starting Xorg (for wallpaper): feh --bg-scale /home/$USER/.local/wallpapers/landspace.jpg

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
         feh picom unclutter dmenu lxappearance ttf-hack-nerd pulsemixer xcursor-breeze google-chrome

# Install dotfiles

cp .xinitrc /home/$USER

cp .fehbg /home/$USER

cp .vimrc /home/$USER

cp .zshrc /home/$USER

cp bspwmrc /home/$USER/.config/bspwm

cp sxhkdrc /home/$USER/.config/sxhkd

cp picom.conf /home/$USER/.config # This is so that the chrome borders look normal

cp landscape.jpg /home/$USER/.local/wallpapers

# Install vim plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download and install zsh-colored-man-pages

bash install-zsh-colored-man-pages.sh

# Enable and start pipwire

systemctl --user enable pipewire-pulse
systemctl --user start pipewire-pulse

# Lastly setup my st build

cd st-0.8.4

make

sudo make install


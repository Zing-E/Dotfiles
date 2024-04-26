#!/bin/bash

# My Arch setup script (base-devel is needed for this)

# NOTE
# Run this after starting Xorg (for wallpaper): feh --bg-scale /home/$USER/.local/wallpapers/landspace.jpg
# Also run :PlugInstall in vim to install plugins
# And please read what this script does, don't run commands from the internet if you don't know what there doing!
 
# Create used directories

mkdir -p /home/$USER/.config/{bspwm,sxhkd,ranger} /home/$USER/.local/{bin,wallpapers} 
 
# Download and install yay (its an aur manager)

git clone https://aur.archlinux.org/yay.git

cd yay || exit

makepkg -si

cd .. # Go back to Dotfiles

# Install usefull software

yay -S zsh zsh-syntax-highlighting bat eza wget xorg xorg-devel xorg-xinit bspwm sxhkd \
       git nano feh picom unclutter dmenu lxappearance htop ranger ueberzug ttf-hack-nerd pulsemixer tty-clock \
       xcursor-breeze google-chrome

# Install dotfiles

cp .xinitrc /home/$USER

cp .vimrc /home/$USER

cp .zshrc /home/$USER

cp bspwmrc /home/$USER/.config/bspwm

cp sxhkdrc /home/$USER/.config/sxhkd

# Add ranger plugin for icons

cp rc.conf /home/$USER/.config/ranger

git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

cp picom.conf /home/$USER/.config # This is so that the chrome borders look normal

cp landscape.jpg /home/$USER/.local/wallpapers

# Scripts

cp scripts/gap /home/$USER/.local/bin

cp scripts/gar /home/$USER/.local/bin

cp scripts/dfsave /home/$USER/.local/bin

# Install vim plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download and install zsh-colored-man-pages (read this script before runnig it)

bash install-zsh-colored-man-pages.sh

# Enable and start pipwire

systemctl --user enable pipewire-pulse
systemctl --user start pipewire-pulse

# Lastly setup my st build

cd st-0.8.4 || exit

make

sudo make install

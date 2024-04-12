#!/bin/bash

# My Arch setup script (base-devel is needed for this)

# NOTE
# Run this after starting Xorg (for wallpaper): feh --bg-scale /home/$USER/.local/wallpapers/landspace.jpg
# Also run :PlugInstall in vim to install plugins
# And please read what this script does, don't run commands on root from the internet;
# if you dont know what there doing!
 
# Create used directories

mkdir -p /home/$USER/.config/bspwm /home/$USER/.config/sxhkd /home/$USER/.local/bin \
        /home/$USER/.local/wallpapers
 
# Download and install yay (its an aur manager)

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

cd .. # Go back to Dotfiles

# Install usefull software

yay -S zsh zsh-syntax-highlighting zsh-autosuggestions bat eza wget xorg xorg-devel xorg-xinit bspwm sxhkd git nano \
         feh picom unclutter dmenu lxappearance htop ttf-hack-nerd pulsemixer tty-clock xcursor-breeze \
         google-chrome

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

# Download and install zsh-colored-man-pages (read this script before runnig it)

bash install-zsh-colored-man-pages.sh

# Enable and start pipwire

systemctl --user enable pipewire-pulse
systemctl --user start pipewire-pulse

# Lastly setup my st build

cd st-0.8.4

make

sudo make install

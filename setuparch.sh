#!/bin/bash

# My Arch/Artix setup script (base-devel is needed for this)

# NOTE
# Run this after starting Xorg (for wallpaper): feh --bg-scale /home/$USER/.local/wallpapers/landspace.jpg
# Also run :PlugInstall in vim to install plugins.
# If using Artix Linux enable the Arch repo extra for some packages here.
# And please read what this script does, don't run commands from the internet if you don't know what there doing!
 
# Create used directories

mkdir -p /home/$USER/.config/{bspwm,sxhkd,ranger} /home/$USER/.local/{bin,wallpapers} 
 
# Download and install yay (its an aur manager)

git clone https://aur.archlinux.org/yay.git

cd yay || exit

makepkg -si

cd .. # Go back to Dotfiles

# Install usefull software

yay -S zsh zsh-syntax-highlighting bat eza wget neofetch shellcheck xorg xorg-devel xorg-xinit bspwm sxhkd \
       git nano feh picom unclutter dmenu lxappearance htop ranger ueberzug ttf-hack-nerd pulsemixer tty-clock \
       xcursor-breeze google-chrome

# Install dotfiles

cp .xinitrc /home/$USER

cp .vimrc /home/$USER

cp .zshrc /home/$USER

cp bspwmrc /home/$USER/.config/bspwm

cp sxhkdrc /home/$USER/.config/sxhkd

cp rc.conf /home/$USER/.config/ranger

cp picom.conf /home/$USER/.config # This is so that the chrome borders look normal

cp landscape.jpg /home/$USER/.local/wallpapers

# Scripts

cp scripts/* /home/$USER/.local/bin

# Install vim plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download and install zsh-colored-man-pages (read this script before runnig it)

bash install-zsh-colored-man-pages.sh

# Enable and start pipewire

if grep -q "Artix" /etc/os-release 
then
	echo "See .xintrc for pipewire"
else
	systemctl --user enable pipewire-pulse
	systemctl --user start pipewire-pulse
fi

# Lastly setup my st build

cd st-0.8.4 || exit

make

sudo make install

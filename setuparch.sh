#!/bin/bash

# My Arch setup script (base-devel is needed for this)

# NOTE
# Run this after starting Xorg (for wallpaper): feh --bg-scale /home/"$USER"/.local/wallpapers/landscape.jpg
# Also run :PlugInstall in vim to install plugins.
# And please read what this script does, don't run commands from the internet if you don't know what they're doing!
 
# Create used directories

mkdir -p /home/"$USER"/.cache/aur /home/"$USER"/.config/{bspwm,polybar,ranger,sxhkd} \
	/home/"$USER"/.local/{bin,wallpapers} 

# Install useful software

sudo pacman -S aircrack-ng arp-scan aws-vault bind bitwarden bspwm dmenu eza feh firejail gdb git go gvim hashcat john \
	ltrace lxappearance man-pages mpv nano noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra nmap pass picom \
	polybar pulsemixer python-pipx ranger shellcheck strace sxhkd tcpdump ttf-hack-nerd tor torbrowser-launcher ueberzugpp \
   	unclutter valgrind vlc wget wireshark-qt xclip xorg xorg-xinit yt-dlp zsh zsh-syntax-highlighting 

# Download software from aur

./scripts/aur install aws-cli-bin brave-bin gruvbox-dark-gtk htop-vim xcursor-breeze 

# Install dotfiles

cp bspwmrc /home/"$USER"/.config/bspwm

cp landscape.jpg /home/"$USER"/.local/wallpapers

cp picom.conf /home/"$USER"/.config 

cp config.ini /home/"$USER"/.config/polybar

cp rc.conf /home/"$USER"/.config/ranger

cp sxhkdrc /home/"$USER"/.config/sxhkd

cp .xinitrc /home/"$USER"

cp .vimrc /home/"$USER"

cp .zshrc /home/"$USER"
 
# Scripts

cp scripts/* /home/"$USER"/.local/bin

# Install vim plug

curl -fLo /home"$USER"/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download and install zsh-colored-man-pages (read this script before runnig it)

cd zsh-colored-man-pages || exit

makepkg -si

cd ..

# Enable pulsewire-pulse

systemctl --user enable pipewire-pulse

systemctl --user start pipewire-pulse 

# Lastly setup my st and dmenu build

cd st-0.8.4 || exit

make

sudo make install

cd ..

cd dmenu-5.2 || exit

make 

sudo make install

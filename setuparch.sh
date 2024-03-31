#!/bin/bash
#
# Arch Setup Script

USER=ethan

sudo pacman -S git

git clone https:/aur.archlinux.org/yay

cd yay && makepkg -si # Install yay

cd .. 

# Install Desktop utils
yay -S bspwm sxhkd picom feh xorg xorg-xinit unclutter htop neofetch vim python google-chrome

# Download muh Dotfiles

git clone https://github.com/Zing-E/Dotfiles

cd Dotfiles

mkdir -p /home/$USER/.config/bspwm /home/$USER/.config/sxhkd

cp bswmrc /home/$USER/bspwm/

cp sxhkdrc /home/$USER/sxhkd/

cp .zshrc /home/$USER/

cp .vimrc /home/$USER/

mkdir -p /home/$USER/.local/src

mv st /home/$USER/.local/src

cd /home/$USER/.local/src

make && sudo make install # Install st

cd /home/$USER/Dotfiles

# Install xinit script

cp .xinitrc /home/$USER

# Install Background photo

mkdir -p /home/$USER/.local/backgrounds

cp backgroud.png /home/$USER/.local/backgrounds

feh --bg-scale /home/$USER/.local/backgrounds/background.png

# Lastly Install vim Plug

cd /home/$USER

curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

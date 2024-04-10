#!/bin/bash

# Install colored man pages from omz into $PKG_DIR

PKG_NAME="zsh-colored-man-pages"
PKG_DIR="/usr/share/zsh/plugins/$PKG_NAME"
# For MacOS
#PKG_DIR="/opt/homebrew/share/$PKG_NAME"

curl -o $PKG_NAME.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh 

chmod 0775 $PKG_NAME.zsh

sudo mkdir -p $PKG_DIR

sudo mv $PKG_NAME.zsh $PKG_DIR

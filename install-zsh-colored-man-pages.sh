#!/bin/bash

# Install colored man pages from omz into $PKG_DIR

PKG_NAME="zsh-colored-man-pages"
PKG_DIR="/usr/share/zsh/plugins/$PKG_NAME"

wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh -O $PKG_NAME.zsh

chmod 0775 $PKG_NAME.zsh

sudo mkdir -p $PKG_DIR

sudo mv $PKG_NAME.zsh $PKG_DIR

#!/bin/bash

# Thinking about making this a MAKEPKG and putting it on aur

PKG_NAME='zsh-colored-man-pages.zsh'
INSTALl_PATH='/usr/share/zsh/plugins/zsh-colored-man-pages'

wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh -O $PKG_NAME

sudo install -dm0775 $INSTALL_PATH/$PKG_NAME


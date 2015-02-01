#!/bin/bash

echo "Configuring Emacs Packages"
echo "==========================="
/bin/rm -R "$HOME"/.cask
git clone git@github.com:cask/cask.git "$HOME"/.cask
cd "$HOME"/.emacs.d
cask install

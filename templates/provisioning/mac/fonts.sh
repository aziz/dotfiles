#!/usr/bin/env bash

echo "Installing Fonts"
echo "================"
while read in; do brew cask install "$in"; done < "$HOME"/.templates/dependencies/fonts

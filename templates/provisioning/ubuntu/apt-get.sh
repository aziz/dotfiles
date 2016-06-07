#!/usr/bin/env bash

echo "Installing packages"
while read -r in; do sudo apt-get -qq -y install "$in"; done < "$HOME"/.templates/dependencies/apt-get

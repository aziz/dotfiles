#!/usr/bin/env bash

echo "Installing Apps"
echo "==============="
while read in; do brew cask install "$in"; done < "$HOME"/.templates/dependencies/apps

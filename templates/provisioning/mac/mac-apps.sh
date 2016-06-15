#!/usr/bin/env bash

echo "Installing Apps"
echo "==============="
while read -r in; do brew cask install --force "$in"; done < "$HOME"/.templates/dependencies/apps

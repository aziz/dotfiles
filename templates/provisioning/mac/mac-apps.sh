#!/usr/bin/env bash

echo "Installing Apps"
echo "==============="
while read -r in; do brew install --cask --force "$in"; done < "$HOME"/.templates/dependencies/apps

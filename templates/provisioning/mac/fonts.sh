#!/usr/bin/env bash

echo "Installing Fonts"
echo "================"
while read -r in; do
  brew cask install "$in"
done < <(grep -v -E '^$|^#' "$HOME"/.templates/dependencies/fonts)

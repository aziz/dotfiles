#!/usr/bin/env bash

echo "Installing Fonts"
echo "================"
while read -r in; do
  brew install --cask --force "$in"
done < <(grep -v -E '^$|^#' "$HOME"/.templates/dependencies/fonts)

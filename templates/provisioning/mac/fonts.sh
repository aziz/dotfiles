#!/usr/bin/env bash

echo "Installing Fonts"
echo "================"
while read -r in; do
  brew cask install --force "$in"
done < <(grep -v -E '^$|^#' "$HOME"/.templates/dependencies/fonts)

wget -P $HOME/Downloads https://developer.apple.com/design/downloads/SF-Font-Pro.dmg
wget -P $HOME/Downloads https://developer.apple.com/design/downloads/SF-Font-Compact.dmg
wget -P $HOME/Downloads https://developer.apple.com/design/downloads/SF-Mono.dmg
wget -P $HOME/Downloads https://developer.apple.com/design/downloads/NY-Font.dmg

#!/bin/bash

echo "Installing homebrew"
echo " _                          _                       "
echo "| |                        | |                      "
echo "| |__   ___  _ __ ___   ___| |__  _ __ _____      __"
echo "| '_ \ / _ \| '_ \` _ \ / _ \ '_ \| '__/ _ \ \ /\ / /"
echo "| | | | (_) | | | | | |  __/ |_) | | |  __/\ V  V / "
echo "|_| |_|\___/|_| |_| |_|\___|_.__/|_|  \___| \_/\_/  "
echo "_____________________________________________________"
echo
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

echo "==> Tapping extra sources"
while read in; do brew tap "$in"; done < "$HOME"/.templates/dependencies/taps

echo "==> Pouring homebrew formulas"
while read in; do brew install "$in"; done < "$HOME"/.templates/dependencies/brew

echo "==> Installing global npm packages"
while read in; do npm install -g "$in"; done < "$HOME"/.templates/dependencies/npm

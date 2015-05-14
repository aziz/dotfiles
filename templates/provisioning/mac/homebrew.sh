#!/usr/bin/env bash

echo "Installing homebrew"
echo " _                          _                       "
echo "| |                        | |                      "
echo "| |__   ___  _ __ ___   ___| |__  _ __ _____      __"
echo "| '_ \ / _ \| '_ \` _ \ / _ \ '_ \| '__/ _ \ \ /\ / /"
echo "| | | | (_) | | | | | |  __/ |_) | | |  __/\ V  V / "
echo "|_| |_|\___/|_| |_| |_|\___|_.__/|_|  \___| \_/\_/  "
echo "_____________________________________________________"
echo
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "==> Tapping extra sources"
while read in; do brew tap "$in"; done < "$HOME"/.templates/dependencies/taps

echo "==> Pouring homebrew formulas"
while read in; do brew install "$in"; done < "$HOME"/.templates/dependencies/brew

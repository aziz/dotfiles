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
brew tap `cat ~/.templates/dependencies/taps`
brew update
xcode-select --install
brew install `cat ~/.templates/dependencies/brew`
npm install -g `cat ~/.templates/dependencies/npm`

echo "Installing Ruby Version Manager"
echo " _ ____   ___ __ ___  "
echo "| '__\ \ / / '_ \` _ \ "
echo "| |   \ V /| | | | | |"
echo "|_|    \_/ |_| |_| |_|"
echo "_______________________"
echo
curl -sSL https://get.rvm.io | bash -s stable
install ruby x
use ruby x as default
gem install `cat ~/.templates/dependecies/gem`

echo "Installing Apps"
echo "==============="
brew cask install `cat ~/.templates/dependencies/apps`
brew cask alfred link

echo "Installing Fonts"
echo "================"
brew cask install `cat ~/.templates/dependencies/fonts`


echo "Installing Pow Server"
echo "====================="
curl get.pow.cx | sh

# SUBLIME
# install sublime package manager
# install sublime_packages

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
brew tap $(cat "$HOME"/.templates/dependencies/taps)
brew update
xcode-select --install
brew install $(cat "$HOME"/.templates/dependencies/brew)
npm install -g $(cat "$HOME"/.templates/dependencies/npm)

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
gem install $(cat "$HOME"/.templates/dependencies/gem)

echo "Installing Apps"
echo "==============="
brew cask install $(cat "$HOME"/.templates/dependencies/apps)
brew cask alfred link

echo "Installing Fonts"
echo "================"
brew cask install $(cat "$HOME"/.templates/dependencies/fonts)


echo "Installing Pow Server"
echo "====================="
curl get.pow.cx | sh

# SUBLIME
# install sublime package manager
# install sublime_packages

echo "Installing Vundle: Vim Plugin Manager"
echo "====================================="
mkdir -p ~/.vim/bundle/
sudo rm -Rf  ~/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

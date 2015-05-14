#!/usr/bin/env bash

echo "Installing Vundle: Vim Plugin Manager"
echo "====================================="
mkdir -p ~/.vim/bundle/backup
rm -Rf  ~/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

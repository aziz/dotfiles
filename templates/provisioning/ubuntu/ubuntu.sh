#!/usr/bin/env bash

echo "Adding extra repos..."
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update

source "$HOME"/.templates/provisioning/ubuntu/apt-get.sh
source "$HOME"/.templates/provisioning/ubuntu/fonts.sh

source "$HOME"/.templates/provisioning/vim.sh
source "$HOME"/.templates/provisioning/ruby.sh
source "$HOME"/.templates/provisioning/npm.sh
source "$HOME"/.templates/provisioning/sublime.sh

if [ "$(uname)" = "Linux" ]; then
  sudo ln -s /usr/local/bin/nodejs /usr/bin/node
fi

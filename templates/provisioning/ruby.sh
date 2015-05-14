#!/usr/bin/env bash

echo "Installing Ruby Version Manager"
echo " _ ____   ___ __ ___  "
echo "| '__\ \ / / '_ \` _ \ "
echo "| |   \ V /| | | | | |"
echo "|_|    \_/ |_| |_| |_|"
echo "_______________________"
echo
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
while read in; do echo "==> Installing Ruby $in";rvm install ruby-"$in"; done < "$HOME"/.templates/dependencies/rubies
source ~/.bashrc
rvm use ruby-"$(cat "$HOME"/.templates/dependencies/ruby-default)" --default
rvm list
while read in; do gem install "$in"; done < "$HOME"/.templates/dependencies/gem

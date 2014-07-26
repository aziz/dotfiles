#!/bin/bash

echo "Installing Ruby Version Manager"
echo " _ ____   ___ __ ___  "
echo "| '__\ \ / / '_ \` _ \ "
echo "| |   \ V /| | | | | |"
echo "|_|    \_/ |_| |_| |_|"
echo "_______________________"
echo
curl -sSL https://get.rvm.io | bash -s stable
while read in; do echo "==> Installing Ruby $in";rvm install ruby-"$in"; done < "$HOME"/.templates/dependencies/rubies
source ~/.bashrc
rvm use ruby-$(cat "$HOME"/.templates/dependencies/ruby-default) --default
rvm list
while read in; do gem install "$in"; done < "$HOME"/.templates/dependencies/gem

echo "Installing Pow Server"
echo "====================="
curl get.pow.cx | sh

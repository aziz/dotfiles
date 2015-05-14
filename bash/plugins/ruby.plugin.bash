#!/usr/bin/env bash

remove_gem() {
  gem list | grep "$1" | awk '{ print $1; }' | xargs sudo gem uninstall
}

fav_gems_install() {
  while read in; do gem install "$in"; done < "$HOME"/.templates/dependencies/gem
}

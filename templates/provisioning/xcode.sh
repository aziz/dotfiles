#!/usr/bin/env bash

dotfilesDir="$HOME/.templates/xcode"
target="$HOME/Library/Developer/Xcode/UserData"

for dir in $(ls $dotfilesDir); do
  if [ -d "$target/$dir" ]; then
    rm -Rf "$target/$dir"
  fi
done

for dir in $dotfilesDir/*; do
  ln -s "$dir" "$target"
done

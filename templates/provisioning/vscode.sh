#!/usr/bin/env bash

dotfilesDir="$HOME/.templates/vscode"
target="$HOME/Library/Application Support/Code/User"

for file in $(ls $dotfilesDir); do
  if [ -f "$target/$file" ]; then
    rm "$target/$file"
  fi
done

for file in $dotfilesDir/*.json; do
  ln -s "$file" "$target"
done

#!/usr/bin/env bash

atom_packages_file="$HOME/.templates/dependencies/atom"
atom_dotfiles_dir="$HOME/.templates/atom"
target="$HOME/.atom"

for file in $(ls $atom_dotfiles_dir); do
  if [ -f "$target/$file" ]; then
    rm "$target/$file"
  fi
done

for file in $atom_dotfiles_dir/*.{cson,coffee,less}; do
  ln -s "$file" "$target"
done

echo "Installing Atom packages"
apm install --packages-file "$atom_packages_file"

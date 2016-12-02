#!/usr/bin/env bash

vscode_dotfiles_dir="$HOME/.templates/vscode"
target="$HOME/Library/Application Support/Code/User"

for file in $(ls $vscode_dotfiles_dir); do
  if [ -f "$target/$file" ]; then
    rm "$target/$file"
  fi
done

for file in $vscode_dotfiles_dir/*.json; do
  ln -s "$file" "$target"
done

echo "Installing VS-Code Extensions"
echo "====================================="
while read -r in; do code --install-extension "$in"; done < "$HOME/.templates/dependencies/vscode"

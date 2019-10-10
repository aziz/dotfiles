#!/usr/bin/env bash

vscode_dotfiles_dir="$HOME/.templates/vscode"
vscode_target="$HOME/Library/Application Support/Code/User"

for file in $(ls $vscode_dotfiles_dir); do
  if [ -f "$vscode_target/$file" ]; then
    rm "$vscode_target/$file"
  fi
done

for file in $vscode_dotfiles_dir/*.json; do
  ln -s "$file" "$vscode_target"
done

echo "Installing VS-Code Extensions"
echo "====================================="
while read -r in; do code --install-extension "$in"; done < "$HOME/.templates/dependencies/vscode"

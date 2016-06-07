#!/usr/bin/env bash

echo "Installing VS-Code Extensions"
echo "====================================="

while read -r in; do code --install-extension "$in"; done < "$HOME/.templates/dependencies/vscode"

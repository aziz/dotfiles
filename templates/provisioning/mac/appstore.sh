#!/usr/bin/env bash

echo "Installing Mac AppSore Apps"
echo "==========================="
while read -r in; do
  mas install "$in"
done < <(gsed -E 's/#.+//g' "$HOME"/.templates/dependencies/apps_appstore)

#!/usr/bin/env bash

echo "==> Installing global npm packages"
while read -r in; do npm install -g "$in"; done < "$HOME"/.templates/dependencies/npm
tldr --update

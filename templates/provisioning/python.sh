#!/usr/bin/env bash

echo "==> Installing global pip packages"
while read -r in; do pip3 install "$in" && pip2 install "$in"; done < "$HOME"/.templates/dependencies/pip

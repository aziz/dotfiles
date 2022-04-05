#!/usr/bin/env bash

echo "Installing Apps"
echo "==============="
brew install --cask --force $(cat "$HOME"/.templates/dependencies/apps|grep -v "#")

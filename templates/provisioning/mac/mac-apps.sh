#!/usr/bin/env bash

echo "Installing Apps"
echo "==============="
brew install --cask --force $(cat "$HOME"/.templates/dependencies/apps | grep -v "#")

echo "Installing Browsers"
echo "==================="
brew install --cask --force $(cat "$HOME"/.templates/dependencies/apps_browsers | grep -v "#")

#!/usr/bin/env bash

echo "Installing Mac AppSore Apps"
echo "==========================="
while read -r in; do
  mas install "$in"
done < <(sed -E 's/#.+//g' templates/dependencies/appstore-apps)

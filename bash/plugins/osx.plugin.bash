#!/bin/bash

mac-who-runs-shit-without-my-command () {
  # loop over all folders and give a list
  #   ~/Library/LaunchAgents
  #   /Library/LaunchAgents
  #   /Library/LaunchDaemons
  # - /System/Library/LaunchAgents
  # - /System/Library/LaunchDaemons

  locations="$HOME/Library/LaunchAgents /Library/LaunchAgents /Library/LaunchDaemons"
  for loc in $locations; do
    echo "${background_green}$loc${normal}"
    ls "$loc" | awk '{ gsub(/.plist/, ""); print }'
  done;
}

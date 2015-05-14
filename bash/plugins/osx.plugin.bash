#!/usr/bin/env bash

mac-who-runs-shit-without-my-command () {
  # loop over all folders and give a list
  #   ~/Library/LaunchAgents
  #   /Library/LaunchAgents
  #   /Library/LaunchDaemons
  #   /Library/StartupItems
  #   crontab -l 2> /dev/null
  #   login items
  # - /System/Library/LaunchAgents
  # - /System/Library/LaunchDaemons

  locations="$HOME/Library/LaunchAgents /Library/LaunchAgents /Library/LaunchDaemons /Library/StartupItems"
  for loc in $locations; do
    echo "${background_green}$loc${normal}"
    ls -1 "$loc" | awk '{ gsub(/.plist/, ""); print }'
  done;

  echo "${background_green}crontab${normal}"
  crontab -l 2> /dev/null

  echo "${background_green}Login Items${normal}"
  osascript -e 'tell application "System Events" to get the name of every login item' | sed -e  $'s/, /\\\n/g'
}

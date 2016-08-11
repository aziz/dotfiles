#!/usr/bin/env bash

# TODO:
# /System/Library/LaunchAgents
# /System/Library/LaunchDaemons
# ~/Library/Internet Plug-Ins
# /Library/Internet Plug-Ins
# ~/Library/Safari/Extensions
# ~/Library/Application Support/Google/Chrome/Default/Extensions

# see this link for more help: http://www.circl.lu/pub/tr-08/
mac-who-runs-shit-without-my-command () {
  # loop over all folders and give a list
  #   ~/Library/LaunchAgents
  #   /Library/LaunchAgents
  #   /Library/LaunchDaemons
  #   /Library/StartupItems
  #   /System/Library/StartupItems
  #   crontab -l 2> /dev/null
  #   login items
  #
  # Ignored ones (system is protected?)
  #   /System/Library/LaunchAgents
  #   /System/Library/LaunchDaemons
  #   /System/Library/StartupItems

  locations="$HOME/Library/LaunchAgents \
             /Library/LaunchAgents \
             /Library/LaunchDaemons \
             /Library/StartupItems"
  for loc in $locations; do
    echo "${background_green}$loc${normal}"
    ls -1 "$loc" | awk '{ gsub(/.plist/, ""); print }'
  done;

  echo "${background_green}crontab${normal}"
  crontab -l 2> /dev/null

  echo "${background_green}Login Items${normal}"
  osascript -e 'tell application "System Events" to get the name of every login item' | sed -e  $'s/, /\\\n/g'
}

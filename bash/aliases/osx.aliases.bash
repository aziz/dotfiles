#!/usr/bin/env bash

if [ "$(uname)" = "Darwin" ]; then
  alias preview='open -a $PREVIEW'
  alias safari="open -a safari"
  alias firefox="open -a firefox"
  alias chrome="open -a google\ chrome"
  alias gx="gitx --commit"
  alias f="open -a Finder "
  alias ql="qlmanage -p"

  # Lock OSX
  alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

  # Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
  alias update='sudo softwareupdate -i -a; brew update; brew outdated; brew upgrade --all; brew cleanup; npm -g outdated --depth=0; npm install npm -g; npm update -g; gem update --system; gem outdated; gem update'

  # Empty the Trash on all mounted volumes and the main HDD
  # Also, clear Apple’s System Logs to improve shell startup speed
  alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

  alias mac-desktop-hide="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
  alias mac-desktop-show="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

  # Show/hide hidden files in Finder
  alias mac-finder-hidden-show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
  alias mac-finder-hidden-hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

  alias mac-hide="chflags hidden"
  alias mac-show="chflags nohidden"

  alias mac-fast-terminal='sudo rm -rf /private/var/log/asl/*.asl'

  alias mac-fix-open-with-duplicated='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user && killall Finder && echo "Open With has been rebuilt, Finder will relaunch"'

  alias mac-openports='sudo lsof -iTCP -sTCP:LISTEN -P'

  # Recursively delete `.DS_Store` files
  alias mac-ds-store-cleanup="find . -name '*.DS_Store' -type f -ls -delete"

  alias mac-mac-address-wired="ifconfig en0 | grep ether"
  alias mac-mac-address-wireless="ifconfig en1 | grep ether"
fi

#!/bin/bash

# Desktop Programs
alias preview="open -a '$PREVIEW'"
alias xcode="open -a '/Developer/Applications/Xcode.app'"
alias safari="open -a safari"
alias firefox="open -a firefox"
alias chrome="open -a google\ chrome"
alias chromium="open -a chromium"
alias f='open -a Finder '
alias ql='qlmanage -p'
alias textedit='open -a TextEdit'

# TODO: convert to functions with parameters
alias mac-desktop-hide="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias mac-desktop-show="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Disable press-and-hold for keys in favor of key repeat
alias mac-press-and-hold-disable="defaults write -g ApplePressAndHoldEnabled -bool false"
alias mac-press-and-hold-enable="defaults write -g ApplePressAndHoldEnabled -bool true"

alias mac-ssh-keychain-integration-disable="sudo defaults write /Library/Preferences/org.openbsd.openssh KeychainIntegration -bool NO"
alias mac-ssh-keychain-integration-enable="sudo defaults write /Library/Preferences/org.openbsd.openssh KeychainIntegration -bool YES"

alias mac-hide="chflags hidden"
alias mac-show="chflags nohidden"

alias mac-fast-terminal='sudo rm -rf /private/var/log/asl/*.asl'
alias mac-fix-open-with-duplicated='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user && killall Finder && echo "Open With has been rebuilt, Finder will relaunch"'

alias mac-openports='sudo lsof -iTCP -sTCP:LISTEN -P'

# Recursively delete `.DS_Store` files
alias mac-ds-store-cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Always open everything in Finder's list view. This is important.
alias mac-finder-always-use-list-view="defaults write com.apple.Finder FXPreferredViewStyle Nlsv"

alias mac-mac-address-wired="ifconfig en0 | grep ether"
alias mac-mac-address-wireless="ifconfig en1 | grep ether"

# Expand save panel by default
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Save to disk (not to iCloud) by default
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
# defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable Notification Center and remove the menu bar icon
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true

# Remove Dropbox’s green checkmark icons in Finder
# file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
# [ -e "${file}" ] && mv -f "${file}" "${file}.bak"

# Set the icon size of Dock items to 36 pixels
# defaults write com.apple.dock tilesize -int 36

# Disable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool true

# Reset Launchpad
# find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete

# Add iOS Simulator to Launchpad
# sudo ln -sf /Applications/Xcode.app/Contents/Applications/iPhone\ Simulator.app /Applications/iOS\ Simulator.app

### Enable subpixel font rendering on non-Apple LCDs

# To set this to Strong:
# defaults write NSGlobalDomain AppleFontSmoothing -integer 4

# To set this to Smoother:
# defaults write NSGlobalDomain AppleFontSmoothing -integer 3

# To set this to Medium:
# defaults write NSGlobalDomain AppleFontSmoothing -integer 2

# To set this to Minimal:
# defaults write NSGlobalDomain AppleFontSmoothing -integer 1

# To set this to Disabled:
# defaults write NSGlobalDomain AppleFontSmoothing -integer 0

# To reset this setting to the default value:
# defaults delete NSGlobalDomain AppleFontSmoothing

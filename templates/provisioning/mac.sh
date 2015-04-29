#!/bin/bash

if pkgutil --pkg-info=com.apple.pkg.CLTools_Executables > /dev/null 2>&1; then
  echo "==> Mac OSX Command-Line Tools are installed."
else
  echo "==> Installing Command-Line Tools"
  xcode-select --install
fi

sudo defaults write /Library/Preferences/org.openbsd.openssh KeychainIntegration -bool NO
echo "==> Config: Disabled KeychainIntegration for SSH"

sudo defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
echo "==> Config: Save to disk (not to iCloud) by default"

sudo defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
echo "==> Config: Automatically quit printer app once the print jobs complete"

sudo defaults write com.apple.finder CreateDesktop -bool false
echo "==> Config: Hides Desktop"

sudo defaults write com.apple.Finder FXPreferredViewStyle Nlsv
echo "==> Config: Always open everything in Finder's list view"

sudo defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
echo "==> Config: Expand save panel by default"

sudo defaults write -g ApplePressAndHoldEnabled -bool false
echo "==> Config: Disabled press and hold"

sudo killall Finder
sudo killall Dock

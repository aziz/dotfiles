
sudo defaults write /Library/Preferences/org.openbsd.openssh KeychainIntegration -bool NO
echo "Config: Disabled KeychainIntegration for SSH"

sudo defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
echo "Config: Save to disk (not to iCloud) by default"

sudo defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
echo "Config: Automatically quit printer app once the print jobs complete"

if pkgutil --pkg-info=com.apple.pkg.CLTools_Executablesx > /dev/null 2>&1; then
  echo "==> Mac OSX Command-Line Tools are installed."
else
  echo "==> Installing Command-Line Tools"
  xcode-select --install
fi

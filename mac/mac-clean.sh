#!/bin/bash

# cleanup (){
#   # restore sudoers original state
#   sudo sed -ibkp '/Defaults timestamp_timeout=-1/d' /etc/sudoers
# }

# echo "==> Making sudo ask for passwords just once"
# echo "Please, enter your local account's password."
# echo "Defaults  timestamp_timeout=-1" | sudo tee -a /etc/sudoers || exit 2

# -------------------------------------------------------------
# Cleaning Log files
echo "==> cleaning log files"
sudo rm -Rf $HOME/Library/Logs/*
echo "$HOME/Library/Logs"
sudo rm -Rf /Library/Logs/*
echo "/Library/Logs"

# Cleaning Cache files
# echo "==> cleaning cache files"
# sudo rm -Rf $HOME/Library/Caches/*
# echo "$HOME/Library/Caches"
# sudo rm -Rf /Library/Caches/*
# echo "/Library/Caches"

# -------------------------------------------------------------
# # Get rid of localizations: APPS/Contents/Resources/*.lproj
# # except English.lproj, Base.lproj, en.lproj

echo "==> cleaning Locale files"
macCleanList=`mktemp -t macClean`
sudo find /Users /Applications /opt /Library /System -iregex '.*\.lproj' | \
perl -wnE'say for /.+(?<!English)(?<!en)(?<!en_US)(?<!Base)\.lproj/g' > $macCleanList
while read in; do sudo rm -Rf "$in"; done < $macCleanList

# -------------------------------------------------------------
#
# Chrome
# ✔ remove old versions extension
# ✔ clean up old versions of chrome
# - clean up old versions of chrome canary
# - save Local Extension Settings

# Clean Chrome Extensions folder, keeping olny the most recent version
echo "==> cleaning old chrome extensions"
EXTS_DIR="$HOME/Library/Application Support/Google/Chrome/Default/Extensions"
for EDIR in `ls -1 "$EXTS_DIR"`; do
  num_ext=`ls -1 "$EXTS_DIR/$EDIR" | wc -l`
  if [ $num_ext -gt 1 ]; then
    ls -1tUr "$EXTS_DIR/$EDIR" | \
    head -n $(expr $num_ext - 1) | \
    awk -v path="$EXTS_DIR/$EDIR/" '{ print "\"" path $0 "\"" }' | \
    xargs rm -Rf
  fi
done

# Clean up old versions of chrome
chrome=`osascript -e 'POSIX path of (path to application "Chrome")'`
echo "==> cleaning old versions of Google Chrome"
echo $chrome
chrome_versions_count=`ls "$chrome/Contents/Versions" | wc -l`
if [ $chrome_versions_count -gt 1 ]; then
  echo "more than one version, should be cleaned"
else
  echo "just one verison"
fi

# -------------------------------------------------------------
# Listing Launch Agents
echo "==> LaunchAgents"
ls -1 $HOME/Library/LaunchAgents
ls -1 /Library/LaunchAgents
ls -1 /Library/LaunchDaemons

# -------------------------------------------------------------


# Find Stuff
# sudo find ~ /Library /System/Library -iregex '.*iterm.*'
# sudo find /Users /Library /Applications /System /opt /bin /sbin /private  -iregex '.*iterm.*'

# Get rid of all recent files
# sudo find ~ /Library -iregex '.*LSSharedFileList.*'

# $HOME/Library/Messages
# $HOME/Library/Saved Application State
# $HOME/Library/Application Support/CrashReporter


# Delete System fonts I dont use /Library/Fonts
# Delete System dictionaries I dont use /Library/Dictionaries
# Delete DesktopPicktures
# Delete Screen Savers

# BACKUP
# $HOME/Library/Keychains

# cleanup

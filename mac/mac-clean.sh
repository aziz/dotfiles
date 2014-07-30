#!/bin/bash

# -------------------------------------------------------------
# Cleaning Log files
echo "==> cleaning log files"
sudo rm -Rf "$HOME"/Library/Logs/*
echo "$HOME/Library/Logs"
sudo rm -Rf /Library/Logs/*
echo "/Library/Logs"

# Cleaning Cache files
# echo "==> cleaning cache files"
# sudo rm -Rf "$HOME"/Library/Caches/*
# echo "$HOME/Library/Caches"
# sudo rm -Rf /Library/Caches/*
# echo "/Library/Caches"

# -------------------------------------------------------------
# # Get rid of localizations: APPS/Contents/Resources/*.lproj
# # except English.lproj, Base.lproj, en.lproj

echo "==> cleaning Locale files"
macCleanList=`mktemp -t macClean`
echo "searching..."
sudo find /Users /Applications /opt /Library /System -iregex '.*\.lproj' | \
perl -wnE 'say for /.+(?<!English)(?<!en)(?<!en_US)(?<!Base)\.lproj/g' > "$macCleanList"
echo "found `cat $macCleanList | wc -l`"
echo "deleting..."
while read in; do sudo rm -Rf "$in"; done < "$macCleanList"

# -------------------------------------------------------------
# Chrome
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
cleanup_old_versions_of_chrome() {
  chrome_versions_count=0
  if [ ! -z "$chrome" ]; then
    echo "$chrome"
    chrome_versions_count=$(ls "$chrome"/Contents/Versions | wc -l)
    if [[ $chrome_versions_count -gt 1 ]]; then
      echo "more than one version, should be cleaned"
      ls -1tUr "$chrome/Contents/Versions" | \
      head -n $(expr $chrome_versions_count - 1) | \
      awk -v path="$chrome/Contents/Versions/" '{ print "\"" path $0 "\"" }' | \
      xargs rm -Rf
    else
      echo "just one verison"
    fi
  else
    echo "can't find app"
  fi
}

echo "==> cleaning old versions of Google Chrome"
chrome=$(osascript -e 'POSIX path of (path to application "Chrome")' 2> /dev/null)
cleanup_old_versions_of_chrome

chrome=$(osascript -e 'POSIX path of (path to application "Google Chrome Canary")' 2> /dev/null)
echo "==> cleaning old versions of Google Chrome Canary"
cleanup_old_versions_of_chrome

# -------------------------------------------------------------
source clean-fonts.sh

# -------------------------------------------------------------
# Listing Launch Agents
# echo "==> LaunchAgents"
# crontab -l 2> /dev/null
# ls -1 "$HOME"/Library/LaunchAgents
# ls -1 /Library/LaunchAgents
# ls -1 /Library/LaunchDaemons
# ls -1 /Library/StartupItems
# osascript -e 'tell application "System Events" to get the name of every login item' | sed -e  $'s/, /\\\n/g'

# -------------------------------------------------------------


# Get rid of all recent files
# LSSharedFileList
# FXRecentFolders
# NSNavLastRootDirectory
# NSNavLastCurrentDirectory
# NSNavRecentPlaces
# ~/Library/Preferences/com.apple.recentitems.plist
# VLC: ml.xspf

# Find Stuff
# sudo find ~ /Library /System/Library -iregex '.*iterm.*'
# sudo find /Users /Library /Applications /System /opt /bin /sbin /private  -iregex '.*iterm.*'

# $HOME/Library/Messages
# $HOME/Library/Saved Application State
# $HOME/Library/Application Support/CrashReporter

# Delete System dictionaries I dont use /Library/Dictionaries
# Delete DesktopPicktures
# Delete Screen Savers

# BACKUP
# $HOME/Library/Keychains

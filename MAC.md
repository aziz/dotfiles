getconf DARWIN_USER_TEMP_DIR || echo $TMPDIR  
getconf DARWIN_USER_CACHE_DIR

# - chrome : save Local Extension Settings
# - include /var/folders /var/log

# Get rid of all recent files
# LSSharedFileList
# FXRecentFolders
# NSNavLastRootDirectory
# NSNavLastCurrentDirectory
# NSNavRecentPlaces
# ~/Library/Preferences/com.apple.recentitems.plist
# VLC: ml.xspf

# $HOME/Library/Messages
# $HOME/Library/Saved Application State
# $HOME/Library/Application Support/CrashReporter


# BACKUP
$HOME/Library/Keychains

- atom
- textmate

- onepassword
  - ~/Library/Preferences/com.agilebits.onepassword4.plist
  - ~/Library/Preferences/2BUA8C4S2C.com.agilebits.onepassword4-helper.plist
- iterm
  - ~/Library/Preferences/com.googlecode.iterm2.plist
  - /Users/allen/Library/Application Support/iTerm
- transmission
  - ~/Library/Application Support/Transmission
  - ~/Library/Preferences/org.m0k.transmission.LSSharedFileList.plist
  - ~/Library/Preferences/org.m0k.transmission.plist
- spectacle
  - ~/Library/Preferences/com.divisiblebyzero.Spectacle.plist
- skype
  - ~/Library/Preferences/com.skype.skype.plist
  - ~/Library/Application Support/Skype
- gitx
  - ~/Library/Preferences/net.phere.GitX.LSSharedFileList.plist
  - ~/Library/Preferences/net.phere.GitX.plist
- vlc
  - ~/Library/Preferences/org.videolan.vlc/*
  - ~/Library/Preferences/org.videolan.vlc.plist
  - ~/Library/Application Support/VLC
  - ~/Library/Application Support/org.videolan.vlc
  - ~/Library/Application Support/org.videolan.vlc
- mail notifr
  - ~/Library/Containers/com.ashchan.GmailNotifrHelper/*
- twitter
  - ~/Library/Containers/com.twitter.twitter-mac/*
- palua
  - ~/Library/Preferences/com.molowa.palua.plist
- dropbox
  - /Library/DropboxHelperTools
  - ~/.dropbox
- totalfinder
  - ~/Library/Preferences/com.binaryage.totalfinder.plist
  - /Library/ScriptingAdditions/TotalFinder.osax
- bartender
- little-snitch
- chrome
- firefox
- safari
- dock 
  - ~/Library/Preferences/com.apple.dock.plist

- hide desktop
- disable dashboard
- disable control+shift system wide command
- download extra voices
- default settings for finder
  - alwayslist
  - calculate all sizes
  - size and kind only
  - sort by name


https://github.com/pivotal-sprout
https://github.com/pivotal-sprout/sprout
https://github.com/pivotal-sprout/sprout-osx-settings
https://github.com/pivotal-sprout/sprout-osx-settings/blob/master/recipes/set_multitouch_preferences.rb
https://github.com/pivotal-sprout/sprout-osx-settings/blob/master/recipes/set_finder_show_user_home_in_sidebar.rb
https://github.com/pivotal-sprout/sprout-osx-settings/blob/master/recipes/remove_expose_keyboard_shortcuts.rb

caffeinate -dis
https://gist.github.com/luisbarrueco/9259848
http://palcu.blogspot.com.au/2014/06/dotfiles-and-dev-tools-provisioned-by.html

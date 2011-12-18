#!/bin/bash

alias desktop_hide="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias desktop_show="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias spotlight_hide="sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
alias spotlight_show="sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
alias mac_hide="chflags hidden"
alias mac_show="chflags nohidden"
alias openports='sudo lsof -iTCP -sTCP:LISTEN -P'

# Recursively delete `.DS_Store` files
alias ds_store_cleanup="find . -name '*.DS_Store' -type f -ls -delete"

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

if [ -s /usr/bin/firefox ] ; then
  unalias firefox
fi


#!/bin/bash

# TODO: convert to functions with parameters
alias desktop_hide="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias desktop_show="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias spotlight_hide="sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
alias spotlight_show="sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
alias mac_hide="chflags hidden"
alias mac_show="chflags nohidden"
alias openports='sudo lsof -iTCP -sTCP:LISTEN -P'

# Recursively delete `.DS_Store` files
alias ds_store_cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Switches your os x dock between 2d and 3d
dock-switch () {

    if [ $(uname) = "Darwin" ]; then

        if [ $1 = 3d ] ; then
            defaults write com.apple.dock no-glass -boolean NO
            killall Dock

        elif [ $1 = 2d ] ; then
            defaults write com.apple.dock no-glass -boolean YES
            killall Dock

        else
            echo "usage:"
            echo "dock-switch 2d"
            echo "dock-switch 3d."
        fi
    else
        echo "sorry. you're currently not using os x"
    fi
}


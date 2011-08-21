#!/bin/bash

alias desktop_hide="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias desktop_show="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias mac_hide="chflags hidden"
alias mac_show="chflags nohidden"

# Desktop Programs
alias fireworks="open -a '/Applications/Adobe Fireworks CS3/Adobe Fireworks CS3.app'"
alias photoshop="open -a '/Applications/Adobe Photoshop CS3/Adobe Photoshop.app'"
alias preview="open -a '$PREVIEW'"
alias xcode="open -a '/Developer/Applications/Xcode.app'"
alias filemerge="open -a '/Developer/Applications/Utilities/FileMerge.app'"
alias safari="open -a safari"
alias firefox="open -a firefox"
alias chrome="open -a google\ chrome"
alias chromium="open -a chromium"
alias dashcode="open -a dashcode"
alias f='open -a Finder '
alias ql='qlmanage -p'

if [ -s /usr/bin/firefox ] ; then
  unalias firefox
fi


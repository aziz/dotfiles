#!/bin/bash

# fix_slow_terminal
alias fast_terminal='sudo rm -rf /private/var/log/asl/*.asl'

alias fix_open_with_duplicated='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user && killall Finder && echo "Open With has been rebuilt, Finder will relaunch"'

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



#!/bin/bash

alias chrome_remote_debugging='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222'
alias update_all="brew update && brew outdated && npm -g outdated && npm -g update && rvm get latest"

# Fast editing for dotfiles and notes
alias edn="z notes && s ."
alias edd="z dotfiles && s ."
alias eds="cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User && s ."

# Server in python
alias server="python -m SimpleHTTPServer 8888"

# SVG
alias svglint="python ~/.bin/scour/scour.py"

# Terminal Notifier for Notification Center in Mac OSX Mountain Lion
alias notify="~/.bin/terminal-notifier.app/Contents/MacOS/terminal-notifier"

# CVS
alias cup='cvs update -A'

# Qwandry gem for opening libraries in Editor
alias qwe='qw -e mate'

# Apache
alias apache_restart="sudo apachectl -k graceful"
alias apache_stop="sudo apachectl -k graceful-stop"
alias apache_start="sudo apachectl -k start"

# crontab
alias cron_install="crontab -r;crontab ~/.cron/cron_jobs"

# npm
alias npmg="npm -g"
alias npmgo="npm -g outdated"

# cofeescript
alias coffee_watch="coffee -r coffeescript-growl -w"

# BURT
function git_current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias burt_staging='git push -f origin $(git_current_branch):staging && be cap staging deploy'
alias burt_prod='git push -f origin $(git_current_branch):production && be cap production deploy'
alias burt_accept='git push -f origin $(git_current_branch):accept && be cap accept deploy'
alias burt_labs='git push -f origin $(git_current_branch):labs && be cap labs deploy'

# Clean up
alias rm='rmtrash'
alias diff='colordiff'
alias find='gfind'

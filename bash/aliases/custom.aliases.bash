#!/bin/bash

# Fast editing for dotfiles and notes
alias edn="z notes && s ."
alias edd="z dotfiles && s ."
alias eds="cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User && s ."

# CT
alias ct='cd ~/calltracks/calltracks-cvs/clientui/rails'
alias ctw='cd ~/calltracks/website-app'

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

alias burt_staging='git push -f origin $(git_current_branch):staging && cap staging deploy'
alias burt_prod='git push -f origin $(git_current_branch):production && cap production deploy'
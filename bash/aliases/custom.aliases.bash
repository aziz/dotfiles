#!/bin/bash

alias chrome_remote_debugging='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222'
alias jless="/usr/local/bin/lessc"

# Better curl: download a file following redirects, https and ignoring security exceptions
alias curll="curl -OLks"

# Markdown
alias md2rtf='pbpaste | markdown | textutil -stdin -stdout -format html -convert rtf | pbcopy'
alias md2html='pbpaste | markdown | browser'

# Fast editing
alias edd="z dotfiles && s ."
alias eds="cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User && s ."

# Server in python
alias server="python -m SimpleHTTPServer 8888"

# Server in ruby
alias serverr="ruby -run -e httpd . -p5000"

# Apache
alias apache_restart="sudo apachectl -k graceful"
alias apache_stop="sudo apachectl -k graceful-stop"
alias apache_start="sudo apachectl -k start"

# crontab
alias cron_install="crontab -r;crontab ~/.cron/cron_jobs"

# Clean up
alias rm="rmtrash"
alias biggest_files="find . -type f -print0 | xargs -0 du -s | sort -n | tail -20 | cut -f2 | xargs -I{} du -sh {}"
alias biggest_folders="du -hsx * | gsort -rh | head -20"

# alias find='gfind'

# Vagrant
alias vg="vagrant"

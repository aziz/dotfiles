alias ct='cd ~/calltracks/calltracks-cvs/clientui/rails && 186'
alias ct3='cd ~/calltracks/rails3'

# fix tmux
alias tmuxu='tmux -u'
alias fixtmux='while true ; do killall -SIGWINCH tmux ; sleep 5 ; done'

# fix_slow_terminal
alias fast_terminal='sudo rm -rf /private/var/log/asl/*.asl'

# CVS
alias cup='cvs update -A'

# Qwandry gem for opening libraries in Editor
alias qwe='qw -e mate'

# projmgr gem
alias pp='projmgr -c'

# heroku gem
alias hh="git push heroku master"

# apache
alias apache_restart="sudo apachectl -k graceful"
alias apache_stop="sudo apachectl -k graceful-stop"

# crontab
alias cron_install="crontab -r;crontab ~/.cron/cron_jobs"

# npm
alias npmg="npm_g"
alias npmgo="npm_g outdated"

# cofeescript
alias coffee-watch="coffee -r coffeescript-growl -w"




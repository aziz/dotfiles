#!/usr/bin/env bash

alias r='rails'
alias rg='rails g'
alias rs='rails s'
alias rc='rails c'
alias rn='rails new'
alias rd='rails dbconsole'
alias rp='rails plugin'
alias ra='rails application'
alias rd='rails destroy'

alias ss='script/server'
alias sc='script/console'
alias ts="thin start"                  # thin server
alias restart='touch tmp/restart.txt'  # restart passenger
alias devlog='tail -f log/development.log'

# rake
alias rt='rake test'
alias rtu='rake test:units'
alias rtf='rake test:functionals'
alias rti='rake test:integration'
alias rr='rake routes'
alias rdbm='rake db:migrate'
alias rdbr='rake db:rollback'

# rubygems
alias gemo='gem outdated'

# pow and powder
alias pr="powder restart"

#!/bin/bash

# Rails Commands
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

rails-help () {
  echo "Rails Aliases Usage"
  echo
  echo "  r           = rails"
  echo "  rg          = rails generate"
  echo "  rs/ss       = rails server"
  echo "  ts          = thin server"
  echo "  rc/sc       = rails console"
  echo "  rn          = rails new"
  echo "  rd          = rails dbconsole"
  echo "  rp          = rails plugin"
  echo "  ra          = rails application"
  echo "  rd          = rails destroy"
  echo "  restartapp  = touch tmp/restart.txt"
  echo "  restart     = touch tmp/restart.txt"
  echo "  devlog      = tail -f log/development.log"
  echo "  taild       = tail -f log/development.log"
  echo
}


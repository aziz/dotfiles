#!/bin/bash

# Bundler Commands
alias b="bundle"
alias be="bundle exec"
alias bi="b install --path vendor"
alias bl="bundle list"
alias bu="bundle update"
alias bp="bundle package"
alias binit="bi && bp && echo 'vendor/ruby' >> .gitignore"

bundler-help () {
  echo "Bundler Aliases Usage"
  echo
  echo " b     = bundle"
  echo " be    = bundle exec"
  echo " bi    = bundle install --path vendor"
  echo " bl    = bundle list"
  echo " bu    = bundle update"
  echo " bp    = bundle package"
  echo " binit = bi && bp && echo 'vendor/ruby' >> .gitignore"
  echo
}


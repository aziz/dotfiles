#!/bin/bash

# Bundler Commands
alias b="bundle"
alias bi="b install --path vendor"
alias be="bundle exec"
alias bl="bundle list"
alias bu="bundle update"
alias bp="bundle package"
alias bout="bundle-outdated"
alias binit="bi && bp && echo 'vendor/ruby' >> .gitignore"

bundler-help () {
  echo "Bundler Aliases Usage"
  echo
  echo " b     = bundle"
  echo " bi    = bundle install --path vendor"
  echo " be    = bundle exec"
  echo " bl    = bundle list"
  echo " bu    = bundle update"
  echo " bp    = bundle package"
  echo " bout  = bundle-outdated"
  echo " binit = bi && bp && echo 'vendor/ruby' >> .gitignore"
  echo
}


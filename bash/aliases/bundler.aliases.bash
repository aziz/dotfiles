#!/bin/bash

# Bundler Commands
alias b="bundle"
alias bi="b install --path vendor"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"
alias be="bundle exec"
alias bl="bundle list"
alias bu="bundle update"
alias bp="bundle package"
alias bout="bundle-outdated"

function bundler-help() {
  echo "Bundler Aliases Usage"
  echo
  echo "  be          = bundle exec"
  echo "  bi          = bundle install"
  echo "  bl          = bundle list"
  echo "  bu          = bundle update"
  echo "  bp          = bundle package"
  echo
}


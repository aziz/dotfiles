#!/usr/bin/env bash

alias b="bundle"
alias be="bundle exec"
alias bi="b install --path vendor"
alias bl="bundle list"
alias bu="bundle update"
alias bp="bundle package"
alias binit="bi && bp && echo 'vendor/ruby' >> .gitignore"

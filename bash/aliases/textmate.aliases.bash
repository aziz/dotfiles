#!/bin/bash

# Textmate

if [[ -x `which mate` ]]; then
  alias e='mate'
  alias et='mate app config db lib public script test spec config.ru Gemfile Rakefile README &'
fi

alias e='mate'
alias et='mate app config db doc lib public test spec vendor Gemfile Rakefile TODO .gitignore .rvmrc &'

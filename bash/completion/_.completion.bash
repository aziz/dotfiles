#!/usr/bin/env bash

if which brew >/dev/null 2>&1; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
  fi
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

if which aws >/dev/null 2>&1; then
  complete -C aws_completer aws
fi

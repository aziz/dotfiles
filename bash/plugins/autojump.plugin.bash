#!/usr/bin/env bash

if [ "$(uname)" = "Linux" ]; then
  [[ -s /usr/share/autojump/autojump.sh ]] && \
  source /usr/share/autojump/autojump.sh
fi

if [ "$(uname)" = "Darwin" ]; then
  if  which brew >/dev/null 2>&1; then
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && \
    source "$(brew --prefix)"/etc/profile.d/autojump.sh
  fi
fi

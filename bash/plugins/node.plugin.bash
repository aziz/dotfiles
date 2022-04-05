#!/usr/bin/env bash

# export NODE_PATH="$HOME/.npm-packages/lib/node_modules"
export NODE_REPL_HISTORY="$HOME/.node_history"
export NODE_REPL_HISTORY_SIZE='32768'

export NVM_DIR="$HOME/.nvm"

if [ -n "$(type -t nvm)" ] && [ "$(type -t nvm)" = function ]; then  
  source "$(brew --prefix nvm)"/nvm.sh
  nvm alias default system >/dev/null;
fi

alias npmls="npm list --depth=0"

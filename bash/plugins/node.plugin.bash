#!/usr/bin/env bash

export NODE_PATH="/usr/local/lib/node_modules"
export NODE_REPL_HISTORY_FILE="$HOME/.node_history"
export NODE_REPL_HISTORY_SIZE='32768'

alias npmg="npm -g"
alias npmgo="npm -g outdated"
alias npmgo0='npm -g outdated --depth=0'
alias npmo0='npm outdated --depth=0'

npmls() {
  npm ls "$@" | grep "^[└├]" | sed "s/─┬/──/g"
}

#!/usr/bin/env bash

export NODE_PATH="$HOME/.npm-packages/lib/node_modules"
export NODE_REPL_HISTORY="$HOME/.node_history"
export NODE_REPL_HISTORY_SIZE='32768'

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

alias npmg="npm -g"
alias npmgo="npm -g outdated"
alias npmgo0='npm -g outdated --depth=0'
alias npmo0='npm outdated --depth=0'

alias ni="npm install"
alias nis="npm install --save"
alias nisd="npm install --save-dev"

npmls() {
  npm ls "$@" | grep "^[└├]" | sed "s/─┬/──/g"
}

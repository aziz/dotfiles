#!/bin/bash

export NODE_PATH="/usr/local/lib/node_modules"
export NODE_REPL_HISTORY_FILE="$HOME/.node_history"
export NODE_REPL_HISTORY_SIZE='32768'

npmls() {
  npm ls "$@" | grep "^[└├]" | sed "s/─┬/──/g"
}

#!/bin/bash

# append to bash_history if Terminal.app quits
shopt -s histappend

# history handling
#
# Erase duplicates
# Bash History
export HISTCONTROL='ignoreboth'
# resize history size
export HISTSIZE=500000

export AUTOFEATURE=true autotest

rh () {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head -n 20
}


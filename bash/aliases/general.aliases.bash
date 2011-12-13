#!/bin/bash

# pressing ctrl+l will trigger ll
# bind -x '"\C-l":"ll"'

# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'
alias w='which'

if [ $(uname) = "Linux" ]
then
	alias ls="ls --color=always"
fi

which gshuf &> /dev/null
if [ $? -eq 1 ]
then
  alias shuf=gshuf
fi

alias c='clear'
alias k='clear'
alias cls='clear'

alias edit="$EDITOR"
alias page="$PAGER"

alias q="exit"

alias irc="$IRC_CLIENT"

# Pianobar can be found here: http://github.com/PromyLOPh/pianobar/

alias piano="pianobar"

alias ..='cd ..'        # Go up one directory
alias ...='cd ../..'    # Go up two directories
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias -- -="cd -"       # Go back

# Shell History
alias h='history'

# Tree
if [ ! -x "$(which tree)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
else 
  alias tree="tree -CAFa -I 'CVS|*.*.package|.svn|.git' --dirsfirst"
fi

# Directory
alias	md='mkdir -p'
alias	rd=rmdir
alias	rmd='rm -Rf'
alias d='dirs -v'

function aliases-help() {
  echo "Generic Alias Usage"
  echo
  echo "  sl     = ls"
  echo "  ls     = ls -G"
  echo "  la     = ls -AF"
  echo "  ll     = ls -al"
  echo "  l      = ls -a"
  echo "  c/k    = clear"
  echo "  ..     = cd .."
  echo "  ...    = cd ../.."
  echo "  -      = cd -"
  echo "  h      = history"
  echo "  md     = mkdir -p"
  echo "  rd     = rmdir"
  echo "  d      = dirs -v"
  echo "  editor = $EDITOR"
  echo "  pager  = $PAGER"
  echo "  piano  = pianobar"
  echo "  q      = exit"
  echo "  irc    = $IRC_CLIENT"
  echo 
}

#!/bin/bash

# pressing ctrl+l will trigger ll
# bind -x '"\C-l":"ll"'

# Reload Library
alias reload='source ~/.bash_profile && echo "bash_profile reloaded"'

# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -alh'
alias l='ls -a'
alias l1='ls -1'
alias lo='ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g''  # convert permissions to octal
alias lss='ls++'

alias recent='ls -lAt | head'
alias old='ls -lAt | tail'

# Directory
alias md='mkdir -p'
alias mkdir='mkdir -p'
alias rd=rmdir
alias rmd='rm -Rf'
alias d='dirs -v'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias -- -="cd -"       # Go back

# Linux Specific
if [ $(uname) = "Linux" ]
then
	alias ls="ls --color=always"
  #pbcopy and pbpaste aliases for GNU/Linux
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# Clear screen
alias c='clear'
alias k='clear'
alias cls='clear'

alias w='which'
alias q="exit"
alias h='history'

alias page="$PAGER"
alias irc="$IRC_CLIENT"

# Tree
if [ ! -x "$(which tree)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
else
  alias tree="tree -CAFa -I 'CVS|*.*.package|.svn|.git' --dirsfirst"
fi

aliases-help () {
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

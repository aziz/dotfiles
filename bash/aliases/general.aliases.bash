#!/usr/bin/env bash

alias d="cd ~/Desktop"
alias dl="cd ~/Downloads"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# List directory contents

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

alias ls="command ls ${colorflag}"
alias sl='ls'
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -alh'
alias l='ls -a'
alias l1='ls -1'
alias lo="ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'"  # convert permissions to octal

alias recent='ls -lAt | head'
alias old='ls -lAt | tail'

# Directory
alias md='mkdir -p'
alias mkdir='mkdir -p'
alias rd=rmdir
alias rmd='rm -Rf'
# alias d='dirs -v'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias -- -="cd -"       # Go back

# Clear screen
alias c='clear'
alias cls='clear'

alias w='which'
alias q="exit"
alias h='history'

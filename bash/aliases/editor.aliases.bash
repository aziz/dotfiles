#!/bin/bash

alias edit="$EDITOR"

# Textmate
alias e="mate"

# Textmate in Linux fallsback to default editor
if [ $(uname) = "Linux" ]
then
  alias e="$EDITOR"
fi

# Sublime Text
alias s="subl3"

# Sublime in Linux
if [ $(uname) = "Linux" ]
then
  alias s="/usr/bin/sublime-text-2"
fi

# Vim
alias v='vim'
alias vi='vim'
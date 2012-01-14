#!/bin/bash

alias edit="$EDITOR"

# Textmate
if [[ -x `which mate` ]]; then
  alias e='mate'
fi

# Sublime Text 2
alias s="subl"

# Sublime in Linux
if [ $(uname) = "Linux" ]
then
  alias s="/usr/bin/sublime-text-2"
fi


# Vim
alias mvim='mvim --remote-tab'
alias v='vim'
alias vi='vim'
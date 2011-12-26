#!/bin/bash

alias edit="$EDITOR"

# Textmate
if [[ -x `which mate` ]]; then
  alias e='mate'
fi

# Sublime Text 2
alias s="subl"

# Vim
alias mvim='mvim --remote-tab'
alias v='vim'
alias vi='vim'
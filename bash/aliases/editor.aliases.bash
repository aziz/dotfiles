#!/bin/bash

alias edit="$EDITOR"
alias e="$EDITOR"

alias s="subl"
alias v='vim'
alias vi='vim'
alias vim_pristine='vim -u NONE'

if [ "$(uname)" = "Linux" ]; then
  alias s="/usr/bin/subl"
  alias subl="/usr/bin/subl"
fi

#!/bin/bash

alias edit='$EDITOR'
alias e='$EDITOR'
alias s='subl'
alias v='vim'
alias vi='vim'
alias vim_pristine='vim -u NONE'

if [ "$(uname)" = "Linux" ]; then
  alias s="/usr/bin/subl"
  alias subl="/usr/bin/subl"
fi

subl_symlink() {
  if [ "$(uname)" = "Darwin" ]; then
    ST_APP=$(osascript -e 'POSIX path of (path to application "Sublime Text")')
    ln -sf "$ST_APP/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
  fi
}

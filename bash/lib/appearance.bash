#!/bin/bash

# colored grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# Less Colors for Man Pages from: http://bit.ly/uYa1mp
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Loading grc (colouriser for beautifying logfiles or output of commands)
# TODO: make it work under linux
if which brew >/dev/null 2>&1; then
  if [ -f `brew --prefix grc`/etc/grc.bashrc ]; then
    source "`brew --prefix grc`/etc/grc.bashrc"
  fi
fi


# Load the theme
if [[ $BASH_THEME ]]; then
    source "$BASH/themes/$BASH_THEME.theme.bash"
fi
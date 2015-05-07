#!/bin/bash

# colored grep
export GREP_COLOR='1;33'

# colored ls
export CLICOLOR=1
export LSCOLORS='ExFxcxdxCxegedabagacad'

# Less Colors for Man Pages from: http://bit.ly/uYa1mp
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Load the theme
if [[ $BASH_THEME ]]; then
  source "$BASH/themes/$BASH_THEME.theme.bash"
fi

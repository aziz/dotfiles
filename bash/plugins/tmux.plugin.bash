#!/usr/bin/env bash

# make sure that tmux is launched in 256 color mode
alias tmux="TERM=xterm-256color tmux -u"

# load tmuxinator if installed
[[ -s "$HOME/.tmuxinator/scripts/tmuxinator" ]] && . "$HOME/.tmuxinator/scripts/tmuxinator"

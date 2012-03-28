#!/bin/bash

# Notes: ---------------------------------------------------------------------------
#
#   When you start an interactive shell (log in, open terminal or iTerm in OS X,
#   create a new tab in iTerm) the following files are read and run, in this order:
#     * profile
#     * bashrc
#     * .bash_profile
#     * .bashrc (only because this file is run (sourced) in .bash_profile)
#
#   When an interactive shell, that is not a login shell, is started
#   (when you run "bash" from inside a shell, or when you start a shell in
#   xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed,
#   in this order:
#     * bashrc
#     * .bashrc
#
# ----------------------------------------------------------------------------------

# Add rvm gems and nginx to the path
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.bin:/usr/local/share/npm/bin:$HOME/.rvm/bin:$PATH"

# Node
export NODE_PATH="/usr/local/lib/node_modules"

# Path to the bash it configuration
export BASH=$HOME/.bash

# Lock and Load a custom theme file from /.bash/themes/
export BASH_THEME='mine'

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR="vim"
export GEM_EDITOR="subl"

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Setting for the new UTF-8 terminal support in Lion
export LANG="en_US.UTF-8"
export LANGUAGE="en_US"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Fixing gcc in lion
export CC=/usr/bin/gcc  #gcc-4.2

export CVS_RSH="ssh"
#export CDPATH=:..:~:~/projects:~/Dropbox:~/Dropbox/projects

# Identify OS and Machine
export OS=`uname -s | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"

# Load Bash It
source $BASH/bash_it.sh

# Don't check mail when opening terminal.
unset MAILCHECK

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

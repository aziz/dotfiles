#!/bin/bash

# Notes: ----------------------------------------------------------
# When you start an interactive shell (log in, open terminal or iTerm in OS X,
# or create a new tab in iTerm) the following files are read and run, in this order:
# profile
# bashrc
# .bash_profile
# .bashrc (only because this file is run (sourced) in .bash_profile)
#
# When an interactive shell, that is not a login shell, is started
# (when you run "bash" from inside a shell, or when you start a shell in
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed,
# in this order:
# bashrc
# .bashrc

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
export CC=gcc-4.2

# Node
export NODE_PATH="/usr/local/lib/node_modules"


# Load Tmuxinator, if you are using it
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Add rvm gems and nginx to the path
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.bin:/usr/local/share/npm/bin:$PATH"

# Path to the bash it configuration
export BASH=$HOME/.bash

# Lock and Load a custom theme file
# location /.bash/themes/
export BASH_THEME='aziz'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to the path of your local jekyll root to use the jekyll aliases

export JEKYLL_LOCAL_ROOT="$HOME/Sites/jekyllsite"

# And change this to the remote server and root

export JEKYLL_REMOTE_ROOT="user@server:/path/to/jekyll/root"

# And, for the last of the jekyll variables, this is the formatting you use, eg: markdown,
# textile, etc. Basically whatever you use as the extension for posts, without the preceding dot

export JEKYLL_FORMATTING="markdown"

# Change this to your console based IRC client of choice.

export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli

export TODO="t"

# Setting for the new UTF-8 terminal support in Lion
export LANG="en_US.UTF-8"
export LANGUAGE="en_US"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Load Bash It
source $BASH/bash_it.sh

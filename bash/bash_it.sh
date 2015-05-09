#!/bin/bash

# Load colors first so they can be use in base theme
source "${BASH}/themes/colors.theme.bash"
source "${BASH}/themes/base.theme.bash"

# Load Library
LIB="${BASH}/lib/*.bash"
for config_file in $LIB
do
  source "$config_file"
done

# Load Tab Completion
COMPLETION="${BASH}/completion/*.bash"
for config_file in $COMPLETION; do
  source "$config_file"
done

# Load Plugins
PLUGINS="${BASH}/plugins/*.bash"
for config_file in $PLUGINS; do
  source "$config_file"
done

# Load Aliases
FUNCTIONS="${BASH}/aliases/*.bash"
for config_file in $FUNCTIONS; do
  source "$config_file"
done

# Load Privates
PRIVATES="${BASH}/../private/*.bash"
for config_file in $PRIVATES; do
  source "$config_file"
done
unset config_file

# Adding Support for other OSes
PREVIEW="less"
[ -s /usr/bin/gloobus-preview ] && PREVIEW="gloobus-preview"
[ -s /Applications/Preview.app ] && PREVIEW="/Applications/Preview.app"

eval "$(direnv hook bash)"

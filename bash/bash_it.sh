#!/usr/bin/env bash

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

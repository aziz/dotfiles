#!/usr/bin/env bash

bash_dirs="lib completion plugins aliases"
for dir in $bash_dirs; do
  LIB="${BASH}/${dir}/*.bash"
  for config_file in $LIB; do
    source "$config_file"
  done
done

# Load Privates
PRIVATES="${BASH}/../private/*.bash"
for config_file in $PRIVATES; do
  source "$config_file"
done

unset config_file
unset bash_dirs

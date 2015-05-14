#!/usr/bin/env bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

if [ "$rvm_path" ]; then
    [[ -r "$rvm_path"/scripts/completion ]] && . "$rvm_path"/scripts/completion
fi

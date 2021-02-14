#!/usr/bin/env bash

if which brew >/dev/null 2>&1; then
  alias brup="brew upgrade && brew cleanup && rm -rf $(brew --cache)/*"
fi

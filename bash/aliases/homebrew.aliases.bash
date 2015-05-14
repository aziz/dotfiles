#!/usr/bin/env bash

if which brew >/dev/null 2>&1; then
  alias br="brew"
  alias bro="brew update && brew outdated"
  alias brup="brew upgrade --all && brew cleanup"
  alias brc="brew cask"
  alias bri="brew install"
  alias brs="brew search"
  alias brh="brew home"
  alias brdr="brew doctor"
fi

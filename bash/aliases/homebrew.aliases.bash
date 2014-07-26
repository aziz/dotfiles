#!/bin/bash

# Some aliases for Homebrew
alias br="brew"
alias bro="brew update && brew outdated"
alias brup="brew upgrade && brew cleanup"
alias brc="brew cask"
alias bri="brew install"
alias brrm="brew uninstall"
alias brls="brew list"
alias brs="brew search"
alias brh="brew home"
alias brdr="brew doctor"

brew-help () {
  echo "Homebrew Alias Usage"
  echo
  echo "br   = brew"
  echo "bro  = brew update && brew outdated"
  echo "brup = brew upgrade && brew cleanup"
  echo "brc  = brew cask"
  echo "bri  = brew install"
  echo "brrm = brew uninstall"
  echo "brls = brew list"
  echo "brs  = brew search"
  echo "brh  = brew home"
  echo "brdr = brew doctor"
  echo
}

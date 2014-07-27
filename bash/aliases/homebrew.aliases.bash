#!/bin/bash

# Some aliases for Homebrew
alias br="brew"
alias bro="brew update && brew outdated"
alias brup="brew upgrade && brew cleanup"
alias brc="brew cask"
alias bri="brew install"
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
  echo "brs  = brew search"
  echo "brh  = brew home"
  echo "brdr = brew doctor"
  echo
}

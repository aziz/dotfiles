# Some aliases for Homebrew
alias br="brew"
alias brup="brew update && brew upgrade"
alias brout="brew outdated"
alias bro="brew outdated"
alias brin="brew install"
alias brrm="brew uninstall"
alias brls="brew list"
alias brsr="brew search"
alias brinf="brew info"
alias brdr="brew doctor"
alias brc="brew cask"

brew-help () {
  echo "Homebrew Alias Usage"
  echo
  echo "brup  = brew update && brew upgrade"
  echo "brout = brew outdated"
  echo "brin  = brew install"
  echo "brrm  = brew uninstall"
  echo "brls  = brew list"
  echo "brsr  = brew search"
  echo "brinf = brew info"
  echo "brdr  = brew doctor"
  echo
}

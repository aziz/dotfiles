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

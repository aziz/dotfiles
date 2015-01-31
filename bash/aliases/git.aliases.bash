#!/bin/bash

# Aliases
alias g='git'
alias gcl='git clone'
alias ga='git add'
alias gaa='git add .'
alias gs='git status'
alias gss='git status -s'
alias gg='git status'
alias ggg='git status -s'
alias gl='git pull'
alias pull='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
alias push='git push'
alias gpp='git pull && git push'
alias gpo='git push origin'
alias gd='git diff'
alias gdd='git diff --cached'
alias gdw='git diff --color-words'
alias gdt='git difftool'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcom='git commit'
alias com='git commit'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'


git-help () {
  echo "Git Custom Aliases Usage"
  echo
  echo "  gcl	  = git clone"
  echo "  g       = git"
  echo "  get 	  = git"
  echo "  ga      = git add"
  echo "  gall	  = git add ."
  echo "  gst/gs  = git status"
  echo "  gss	  = git status -s"
  echo "  gl      = git pull"
  echo "  gup     = git fetch && git rebase"
  echo "  gp      = git push"
  echo "  gd      = git diff | mate"
  echo "  gc      = git commit -v"
  echo "  gca     = git commit -v -a"
  echo "  gb      = git branch"
  echo "  gba     = git branch -a"
  echo "  gcount  = git shortlog -sn"
  echo "  gcp     = git cherry-pick"
  echo "  gco     = git checkout"
  echo "  gexport = git git archive --format zip --output"
  echo "  gdel    = git branch -D"
  echo "  gpo     = git push origin"
  echo "  gmu     = git fetch origin -v; git fetch upstream -v; git merge upstream/master"
  echo
}

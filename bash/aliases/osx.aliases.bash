#!/bin/bash

if [ "$(uname)" = "Darwin" ]; then
  alias preview='open -a $PREVIEW'
  alias safari="open -a safari"
  alias firefox="open -a firefox"
  alias chrome="open -a google\ chrome"
  alias gx="gitx --commit"
  alias f="open -a Finder "
  alias ql="qlmanage -p"
fi

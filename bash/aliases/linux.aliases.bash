#!/usr/bin/env bash

if [ "$(uname)" = "Linux" ]; then
  alias s="/usr/bin/subl"
  alias subl="/usr/bin/subl"

  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

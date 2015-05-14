#!/usr/bin/env bash

# Starting ssh-agent if it's not already started. fix a problem in MacOS Lion 10.7.x
if [ "$(uname)" = "Darwin" ]; then
  if [ "x`ps ax | grep [s]sh-agent`" == "x" ]; then ssh-agent && ssh-add; fi
fi

ssh_list () {
  awk '$1 ~ /Host$/ { print $2 }' ~/.ssh/config
}

#!/bin/bash

# Starting ssh-agent if it's not already started. fix a problem in MacOS Lion 10.7.x
if [ "$(uname)" = "Darwin" ]; then
  if [ "x`ps ax | grep [s]sh-agent`" == "x" ]; then ssh-agent && ssh-add; fi
fi

ssh_add_server () {
  echo -en "\n\nHost $1\n  HostName $2\n  User $3\n  ServerAliveInterval 30\n  ServerAliveCountMax 120" >> ~/.ssh/config
}

ssh_list () {
  awk '$1 ~ /Host$/ { print $2 }' ~/.ssh/config
}

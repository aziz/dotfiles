#!/usr/bin/env bash

alias number_of_cores="grep -c ^processor /proc/cpuinfo"

connections () {
  netstat -ntu | awk 'NR>2 {sub(/:[^:]+$/, ""); print $5}' | sort | uniq
}

list-all-users () {
  cat /etc/passwd | awk -F: '{ if ($3<=499) print "system\t"$1"\t"$6; else print "user\t"$1"\t"$6; }'  | sort | column -t
}



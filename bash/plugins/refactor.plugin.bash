#!/usr/bin/env bash

refactor_large_files () {
  # Usage:
  # refactor_large_files [path] [file-type]
  find "$1" -name "$2" | xargs wc -l | sort -nr | head -n20
}


refactor_churn () {
  # Usage:
  # refactor_churn [path_filter]
  git log --all -M -C --name-only | grep -E "$1" | sort | uniq -c | sort -nr | awk 'BEGIN {print "count,file"} {print $1 "," $2}' | head -n20
}

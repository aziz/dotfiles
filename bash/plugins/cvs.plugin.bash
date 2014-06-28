#!/bin/bash

cvs_rm() {
  rm "$@"
  cvs rm "$@"
}

cvs_diff() {
  cvs diff -bup "$@" | colordiff | less -R
}

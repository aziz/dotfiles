#!/bin/bash

function cvs_rm() {
  rm $*
  cvs rm $*
}

function cvs_diff() {
  cvs diff -bup $* | colordiff | less -R
}

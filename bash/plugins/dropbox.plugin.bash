#!/usr/bin/env bash

dropbox_find_conflicts () {
  find "${HOME}/Dropbox" -regex '.+conflicted copy.+'
}

dropbox_remove_conflicts () {
  find "${HOME}/Dropbox" -regex '.+conflicted copy.+' -print0 | xargs -0 rmtrash
}

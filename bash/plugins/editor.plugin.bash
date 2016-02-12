#!/usr/bin/env bash

code() {
  VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*;
}

subl_symlink() {
  if [ "$(uname)" = "Darwin" ]; then
    ST_APP=$(osascript -e 'POSIX path of (path to application "Sublime Text")')
    ln -sf "$ST_APP/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
  fi
}

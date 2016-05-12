#!/usr/bin/env bash

ST_DIR="$HOME/Library/Application Support/Sublime Text 3"

if [ "$(uname)" = "Linux" ]; then
  ST_DIR="$HOME/.config/sublime-text-3"
fi

# hides minimap
echo '{"settings":{"new_window_settings":{"show_minimap": false}}}' >  "$ST_DIR/Local/Session.sublime_session"

# install package control
mkdir -p "$ST_DIR/Installed Packages"
curl "https://sublime.wbond.net/Package%20Control.sublime-package" -o "$ST_DIR/Installed Packages/Package Control.sublime-package"

# install personal user repo
rm -Rf "$ST_DIR/Packages/User"
mkdir -p "$ST_DIR/Packages/User"
git clone git@github.com:aziz/sublimeText3-Userfiles.git "$ST_DIR/Packages/User"

# install plugins from git
cd "$ST_DIR/Packages" && rm -Rf PlainTasks && git clone git@github.com:aziz/PlainTasks.git
cd "$ST_DIR/Packages" && rm -Rf PlainNotes && git clone git@github.com:aziz/PlainNotes.git
cd "$ST_DIR/Packages" && rm -Rf FileBrowser && git clone git@github.com:aziz/SublimeFileBrowser.git FileBrowser
cd "$ST_DIR/Packages" && rm -Rf "Theme - Default" && git clone git@github.com:aziz/SublimeTheme.git "Theme - Default"
cd "$ST_DIR/Packages" && rm -Rf "SyncedSidebarBg" && git clone git@github.com:aziz/SublimeSyncedSidebarBg.git "SyncedSidebarBg"
cd "$ST_DIR/Packages" && rm -Rf BetterFindBuffer && git clone git@github.com:aziz/BetterFindBuffer.git
cd "$ST_DIR/Packages" && rm -Rf DistractionFreeWindow && git clone git@github.com:aziz/DistractionFreeWindow.git
cd "$ST_DIR/Packages" && rm -Rf ANSIescape && git clone git@github.com:aziz/SublimeANSI.git ANSIescape

# installing subl cli command
if [ "$(uname)" = "Darwin" ]; then
  ST_APP=$(osascript -e 'POSIX path of (path to application "Sublime Text")')
  ln -sf "$ST_APP/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

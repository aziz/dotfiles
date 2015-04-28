#!/bin/bash

ST_DIR="$HOME/Library/Application Support/Sublime Text 3"

# install license
# mkdir -p "$ST_DIR/Local"
# cp "$HOME/.templates/licenses/License.sublime_license" "$ST_DIR/Local/License.sublime_license"

# hides minimap
echo '{"settings":{"new_window_settings":{"show_minimap": false}}}' >  "$ST_DIR/Local/Session.sublime_session"

# install package control
mkdir -p "$ST_DIR/Installed Packages"
curl "https://sublime.wbond.net/Package%20Control.sublime-package" -o "$ST_DIR/Installed Packages/Package Control.sublime-package"

# install personal user repo
rm -Rf "$ST_DIR/Packages/User"
mkdir -p "$ST_DIR/Packages/User"
git clone git@github.com:aziz/sublimeText3-Userfiles.git "$ST_DIR/Packages/User"

# copy theme default
cp -r "$ST_DIR/Packages/User/Theme/Theme - Default" "$ST_DIR/Packages"

# install plugins from git
cd "$ST_DIR/Packages" && rm -Rf PlainTasks && git clone git@github.com:aziz/PlainTasks.git
cd "$ST_DIR/Packages" && rm -Rf PlainNotes && git clone git@github.com:aziz/PlainNotes.git
cd "$ST_DIR/Packages" && rm -Rf FileBrowser && git clone git@github.com:aziz/SublimeFileBrowser.git FileBrowser

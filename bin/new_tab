#!/bin/sh
osascript -e 'tell application "Terminal"' \
-e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' \
-e "do script with command \"cd `pwd`;clear\" in selected tab of the front window" \
-e 'end tell' &> /dev/null
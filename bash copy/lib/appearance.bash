#!/bin/bash

# colored grep

# aggresive grep
# -r recursive, -I no binary file match, -P perl regexp, -s no messages
# export GREP_OPTIONS='-rIPs --exclude-dir=.[a-zA-Z0-9]* --exclude=.* --exclude=*~ --color=auto'

# my grep
#export GREP_OPTIONS='-rIs --exclude=*~ --color=auto'
export GREP_OPTIONS=''
#export GREP_COLOR='1;33'

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# Load the theme
if [[ $BASH_THEME ]]; then
    source "$BASH/themes/$BASH_THEME/$BASH_THEME.theme.bash"
fi
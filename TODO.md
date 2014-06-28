
# Install 
- pow
- automatically install mac apps from app-store??
- add sublime config to dotfiles and install it on demand
- install vim plugins
- compile npmrc on install just like gitconfig
- configure cron on install
- prepare_linux.shell:
``` bash
# to fix a warning in running chrome and sublime from console
sudo apt-get install gtk2-engines-pixbuf
# to have pbpaste and pbcopy aliases to work
sudo apt-get install xclip

local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
```

# VUNDLE
configure
- powerline/Airline
- The NERD tree
- fugitive.vim

- neocomplcache
- snipMate
- SuperTab
- Syntastic
- Indent Guides
- Align
- colors: plasticcodewrap

# TODO: 
- internet speed test
- https://github.com/cowboy/dotfiles

# LINUX (WIP):
- f does not work
- pman does not work
- browser does not work
- seq on linux should not override original command 
- aliases for apt-get and apt-cache search on linux

# FEATURE REQUESTS
- different prompt on server \u@\h in green with cloud icon, override PS1 on server
- merge bash/aliases and bash/plugin into topic related files/folders. things that add functionality or configure an already installed app should be called plugins. plugins can have aliases/functions/exports/completions/help. Others should be stored as pure bash scripts called something else!

> signle letter aliases available:    
> AIJMNOPY

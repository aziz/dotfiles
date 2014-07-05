# TODO: 
```bash
complete -W "list of all words for an automatic completion" command_to_be_completed
```

* Add 'set editing-mode vi' in your ~/.inputrc to use the vi keybindings 
  for bash and all readline-enabled applications (python, mysql, etc)

function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
- function fname() { find . -iname "*$@*"; }
- function remove_lines_from() { grep -F -x -v -f $2 $1; }
  removes lines from $1 if they appear in $2
- Pipe any command over 'column -t' to nicely align the columns
diff --side-by-side fileA.txt fileB.txt
pgrep
'lsof -i' monitors network connections in real time
'iftop' shows bandwith usage per *connection*
'nethogs' shows the bandwith usage per *process*


- move bash scripts in bin forlder to bash folder as function
- internet speed test
- https://github.com/cowboy/dotfiles

# Install Script TODO
- mac config only on a mac
- automatically install mac apps from app-store?
- sublime: add files to dotfiles and install it on demand
- atom: add files to dotfiles and install it on demand
- compile npmrc on install just like gitconfig
- configure cron on install

# Vim: configure 
- The NERD tree
- fugitive.vim
- indentline: disable by default
- CtrlP
- Syntastic
- snipMate
- SuperTab
- colors: plasticcodewrap

# LINUX (WIP):
- f does not work
- pman does not work
- browser does not work
- seq on linux should not override original command 
- aliases for apt-get and apt-cache search on linux
- prepare_linux.shell:
``` bash
# to fix a warning in running chrome and sublime from console
sudo apt-get install gtk2-engines-pixbuf
# to have pbpaste and pbcopy aliases to work
sudo apt-get install xclip

local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
```

# FEATURE REQUESTS
- different prompt on server \u@\h in green with cloud icon, override PS1 on server
- merge bash/aliases and bash/plugin into topic related files/folders. things that add functionality or configure an already installed app should be called plugins. plugins can have aliases/functions/exports/completions/help. Others should be stored as pure bash scripts called something else!

> signle letter aliases available:    
> AIJMNOPY

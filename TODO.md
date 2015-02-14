mv: rename /Users/allen.bargi/.z.tmp to /Users/allen.bargi/.z: No such file or directory

# Emacs:
- https://github.com/emacs-tw/awesome-emacs
- https://github.com/fniessen/emacs-leuven-theme

# TODO
- a file for exporting custom env vars
- IMP use and configure sshrc
- https://github.com/dvorka/hstr
- https://github.com/kcrawford/dockutil
- https://gist.github.com/swarminglogic/8963507
- update *-help functions in aliases
- plugin-help does not work

# Install Script TODO
- configure mac-address-randomizer to run automatically
- atom: add files to dotfiles and install it on demand
- configure cron on install

# Vim: 
- Plugin: gabrielelana/vim-markdown 
- Plugin: tabular
- configure: The NERD tree
- configure: fugitive.vim
- configure: indentline - disable by default
- configure: CtrlP
- configure: Syntastic
- configure: SuperTab
- snipMate

# IDEAS

- pgrep || function psgrep() { ps aux | grep -v grep | grep "$@" -i --color=auto; }
- function fname() { find . -iname "*$@*"; }
- function remove_lines_from() { grep -F -x -v -f $2 $1; } # removes lines from $1 if they appear in $2
- Pipe any command over 'column -t' to nicely align the columns
- diff --side-by-side fileA.txt fileB.txt

- 'lsof -i' monitors network connections in real time
- 'iftop' shows bandwith usage per *connection*
- 'nethogs' shows the bandwith usage per *process*

- internet speed test
- https://github.com/cowboy/dotfiles

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

complete -W "list of all words for an automatic completion" command_to_be_completed
```

# FEATURE REQUESTS
- different prompt on server \u@\h in green with cloud icon, override PS1 on server
- merge bash/aliases and bash/plugin into topic related files/folders. things that add functionality or configure an already installed app should be called plugins. plugins can have aliases/functions/exports/completions/help. Others should be stored as pure bash scripts called something else!

!!! NOTE "single letter aliases available"
    A D I K M N O P T X Y

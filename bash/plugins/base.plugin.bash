#!/bin/bash

# Generic functions:

genpass() {
  echo "${bold_purple}Generating a ${1} characters long password${normal} =>"
  res=$(openssl rand -base64 ${1} | head -c ${1})
  echo "${bold_green}$res${normal}"
}

# Returns the first command that exists, or exit status 1.
# EDITOR=`first_of "mate -w" "nano -w" vi`
first_of() {
  if [ -n "$1" ]; then
    local arg=$1
    shift
    command -v $arg >> /dev/null && echo $arg || first_of "$@"
  else
    exit 1
  fi
}

mkcd() {
  mkdir -p "$*"
  cd "$*"
}

hex() {
  printf "%X\n" $*;
}

man2pdf() {
  man -t "$1" | pstopdf -i -o "$1.pdf"
}

hman() {
  man "$1" | man2html | browser
}

# View man documentation in Preview
pman() {
   man -t "${1}" | open -f -a $PREVIEW
}

pcurl() {
  curl "${1}" | open -f -a $PREVIEW
}

pri() {
  ri -T "${1}" | open -f -a $PREVIEW
}

quiet() {
  $* &> /dev/null &
}

banish-cookies() {
  rm -r ~/.macromedia ~/.adobe
  ln -s /dev/null ~/.adobe
  ln -s /dev/null ~/.macromedia
}

# disk usage per directory, in Mac OS X and Linux
usage() {
    if [ "$(uname)" = "Darwin" ]; then
        if [[ -n $1 ]]; then
            du -hd "$1"
        else
            du -hd 1
        fi

    elif [ "$(uname)" = "Linux" ]; then
        if [[ -n $1 ]]; then
            du -h --max-depth=1 "$1"
        else
            du -h --max-depth=1
        fi
    fi
}

# back up file with timestamp, useful for administrators and configs
buf() {
    filename=$1
    filetime=$(date +%Y%m%d_%H%M%S)
    cp ${filename} ${filename}_${filetime}
}

# List all plugins and functions defined by bash-it
plugins-help() {

    echo "bash-it Plugins Help-Message"
    echo

    set | grep "()" \
    | sed -e "/^_/d" | grep -v "BASH_ARGC=()" \
    | sed -e "/^\s/d" | grep -v "BASH_LINENO=()" \
    | grep -v "BASH_ARGV=()" \
    | grep -v "BASH_SOURCE=()" \
    | grep -v "DIRSTACK=()" \
    | grep -v "GROUPS=()" \
    | grep -v "BASH_CMDS=()" \
    | grep -v "BASH_ALIASES=()" \
    | grep -v "COMPREPLY=()" | sed -e "s/()//"
}

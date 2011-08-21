#!/bin/bash

# For generic functions.

function ips {
  ifconfig | grep "inet " | awk '{ print $2 }'
}

function myip {
  res=$(curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+')
  echo "Your public IP is: ${bold_green} $res ${normal}"
}

function mkcd(){
	mkdir -p "$*"
	cd "$*"
}


function man2pdf() {
  if [ $# -eq 1 ] ; then
      to_pdf=$(which ps2pdf)
      if [ -z "$to_pdf" ] ; then
          to_pdf=$(which pstopdf)
      fi

      name="$1"
      case "$to_pdf"  in
          *pstopdf) man -t "$name" | "$to_pdf" -i -o "$fname.pdf" ;;
          *ps2pdf)  man -t "$name" | "$to_pdf" - "$name.pdf" ;;
          *)        man -t "$name" > "$fname.ps"
      esac
      exit $?
  fi
  echo "Wrong number of parameters"
  exit 1
}

# View man documentation in Preview
pman () {
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

# disk usage per directory
# in Mac OS X and Linux
usage ()
{
    if [ $(uname) = "Darwin" ]; then
        if [ -n $1 ]; then
            du -hd $1
        else
            du -hd 1
        fi

    elif [ $(uname) = "Linux" ]; then
        if [ -n $1 ]; then
            du -h --max-depth=1 $1
        else
            du -h --max-depth=1
        fi
    fi
}

# One thing todo
function t() {
	 if [[ "$*" == "" ]] ; then
		 cat ~/.t
	 else
		 echo "$*" > ~/.t
	 fi
}

# List all plugins and functions defined by bash-it
function plugins-help() {
    
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

# back up file with timestamp
# useful for administrators and configs
buf () {
    filename=$1
    filetime=$(date +%Y%m%d_%H%M%S)
    cp ${filename} ${filename}_${filetime}
}

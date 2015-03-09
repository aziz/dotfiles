#!/bin/bash

myip () {
  pub=$(curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+')
  loc=$(ifconfig | grep "inet " | awk '{ print $2 }')
  echo "public:"
  echo "${bold_green}$pub${normal}"
  echo "local:"
  echo "${bold_green}$loc${normal}"
}

alias ips="myip"

# check to see if a domain is registered or not
isreg () {
  dig soa $1 | grep -q ^$1 && echo "${bold_red}Sorry! it's already registered.${normal}" || echo "${bold_green}No, You can go and register it for yourself :) ${normal}"
}


geoip () {
  echo https://freegeoip.net/json/"$1"
  curl -s https://freegeoip.net/json/"$1" | jq .
}

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias http_dump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# portscan in one line - http://www.shell-fu.org/lister.php?id=295
portscan () {
  HOST="$1";for((port=1;port<=65535;++port));do echo -en "$port ";if echo -en "open $HOST $port\nlogout\quit" | telnet 2>/dev/null | grep 'Connected to' > /dev/null;then echo -en "\n\nport $port/tcp is open\n\n";fi;done
}

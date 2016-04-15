#!/usr/bin/env bash

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

# portscan in one line - http://www.shell-fu.org/lister.php?id=295
portscan () {
  HOST="$1";for((port=1;port<=65535;++port));do echo -en "$port ";if echo -en "open $HOST $port\nlogout\quit" | telnet 2>/dev/null | grep 'Connected to' > /dev/null;then echo -en "\n\nport $port/tcp is open\n\n";fi;done
}

# Create a data URL from a file
dataurl() {
  local mimeType=$(file -b --mime-type "$1");
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8";
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
getcertnames() {
  if [ -z "${1}" ]; then
    echo "ERROR: No domain specified.";
    return 1;
  fi;

  local domain="${1}";
  echo "Testing ${domain}…";
  echo ""; # newline

  local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
    | openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

  if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
    local certText=$(echo "${tmp}" \
      | openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
      no_serial, no_sigdump, no_signame, no_validity, no_version");
    echo "Common Name:";
    echo ""; # newline
    echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
    echo ""; # newline
    echo "Subject Alternative Name(s):";
    echo ""; # newline
    echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
      | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
    return 0;
  else
    echo "ERROR: Certificate not found.";
    return 1;
  fi;
}

weather() {
  if [ -z "${1}" ]; then
    echo "ERROR: No city specified.";
    echo "USAGE: weather city";
    return 1;
  fi;
  curl http://wttr.in/${1}
}

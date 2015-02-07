#!/bin/bash

### Join array elements
# Usage:
# $ join , a "b c" d     #=> a,b c,d
# $ join / var local tmp #=> var/local/tmp
join() {
  local IFS="$1"
  shift; echo "$*"
}


### Split a string on a delimiter
# Usage:
# $ split : "1:2:3:4:5:6:7:8:9"   #=> 1 2 3 4 5 6 7 8 9
split() {
  local DEL="$1"
  local IN="$2"
  arrIN=(${IN//${DEL}/ })
  echo ${arrIN[@]}
}


### Directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$DIR"


### Check requirements
# Usage:
# requirements="sed grep printf cut sort php echo clear"
# checkrequirements
checkrequirements() {
  for req in $requirements; do
    hash "$req" 2>&-
    if [ $? == 1 ]; then echo "please install '$req'"; exit; fi
  done;
}


# Prepend a string to the top of a file
# Usage:
# prepend "hello" ~/test.txt
prepend() {
   printf '%s\n' H 1i "${1}" . wq | ed -s "${2}"
}

# Append multiline
# cat >> path/to/file/to/append-to.txt << "EOF"
# export PATH=$HOME/jdk1.8.0_31/bin:$PATH
# export JAVA_HOME=$HOME/jdk1.8.0_31/
# EOF

#!/bin/bash
#
#   This file echoes a bunch of color codes to the
#   terminal to demonstrate what's available.  Each
#   line is the color code of one forground color,
#   out of 17 (default + 16 escapes), followed by a
#   test use of that color on all nine background
#   colors (default + 8 escapes).
#

colors () {
  if [ $# -eq 0 ]; then
    T='Color' # The test text
  else
    T="$1"   # The test text
  fi

  padding=2
  len=$((${#T}+$padding))

  ch=' '
  SPACER=$(printf '%*s' "$len" | tr ' ' "$ch")

  echo -e "\n            ${SPACER}40m${SPACER}41m${SPACER}42m${SPACER}43m${SPACER}44m${SPACER}45m${SPACER}46m${SPACER}47m";

  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
             '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
             '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
    echo;
  done
  echo
}

colors256 () {
  x=`tput op`
  y=`printf %$((3))s`
  for i in {1..256}; do
    echo -ne `tput setaf $i;tput setab $i`${y// /=}$x
    if (($i % 8 == 0)); then
      echo
    fi
  done
}

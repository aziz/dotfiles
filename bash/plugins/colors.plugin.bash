#!/usr/bin/env bash

colors () {
  if [ $# -eq 0 ]; then
    T='Color'
  else
    T="$1"
  fi

  padding=2
  len=$((${#T}+$padding))

  ch=' '
  SPACER=$(printf '%*s' "$len" | tr ' ' "$ch")

  echo -e "\n            ${SPACER}40m${SPACER}41m${SPACER}42m${SPACER}43m${SPACER}44m${SPACER}45m${SPACER}46m${SPACER}47m";

  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
             '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
             '  36m' '1;36m' '  37m' '1;37m'; do
    FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
      echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m"
    done
    echo
  done
  echo
}


colors_custom () {
  block="▇▇ "
  echo "${custom_blue}${block}\${custom_blue}"
  echo "${custom_cyan}${block}\${custom_cyan}"
  echo "${custom_green}${block}\${custom_green}"
  echo "${custom_orange}${block}\${custom_orange}"
  echo "${custom_purple}${block}\${custom_purple}"
  echo "${custom_red}${block}\${custom_red}"
  echo "${custom_violet}${block}\${custom_violet}"
  echo "${custom_yellow}${block}\${custom_yellow}"
  echo "${custom_white}${block}\${custom_white}"
  echo "${custom_gray}${block}\${custom_gray}"
  echo
  echo "${black}${block}\${black}"
  echo "${red}${block}\${red}"
  echo "${green}${block}\${green}"
  echo "${yellow}${block}\${yellow}"
  echo "${blue}${block}\${blue}"
  echo "${purple}${block}\${purple}"
  echo "${cyan}${block}\${cyan}"
  echo "${white}${block}\${white}"
}

#!/usr/bin/env bash

hex2rgb () {
  hexinput=`echo $1 | tr '[:lower:]' '[:upper:]' | tr -d '#'`
  a=`echo $hexinput | cut -c-2`
  b=`echo $hexinput | cut -c3-4`
  c=`echo $hexinput | cut -c5-6`
  r=`echo "ibase=16; $a" | bc`
  g=`echo "ibase=16; $b" | bc`
  b=`echo "ibase=16; $c" | bc`
  echo "$r,$g,$b"
}

rgb2hex () {
  x=`echo $1 | sed -e 's/,/ /g'`
  echo `ruby -pae '$_=?#+"%02X"*3%$F' <<< "$x"`
}

color () {
  if [[ $1 ]]; then
    block="▇▇▇"
    xterm_color=`python $HOME/.templates/terminal/xterm_color_rgb.py $1`
    xterm_color_16=`printf '%x\n' $xterm_color`
    tput_color=`tput setaf $xterm_color`
    hex_color=`rgb2hex $1`
    echo -e "COLOR\nRGB     \nHEX   \nXTERM\nXTERM16\n$tput_color$block\n$1\n$hex_color\n$xterm_color\n$xterm_color_16" | paste - - - - -
  else
    echo "missing argument" >&2
    cat <<usage
Preview RGB colors in terminal
Usage:
  $ color 255,58,131
  $ color '255,58,131'
usage
    return 1
  fi
}

color_hex () {
  if [[ $1 ]]; then
    color <<< echo `hex2rgb "$1"`
  else
    echo "missing argument" >&2
    cat <<usage
Preview HEX colors in terminal
Usage:
  $ color_hex 4EE161
  $ color_hex '#4EE161'
usage
    return 1
  fi
}

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

colors256 () {
  echo "USAGE: "
  echo "echo -e \`tput setaf \$((16#CODE));\` SAMPLE TEXT"
  python "$HOME"/.templates/terminal/xterm_color_chart.py -nr -x 3 -y 2
}

colors_custom () {
  block="▇▇ "
  echo "${custom_blue}${block}\${custom_blue}"
  echo "${custom_cyan}${block}\${custom_cyan}"
  echo "${custom_green}${block}\${custom_green}"
  echo "${custom_orange}${block}\${custom_orange}"
  echo "${custom_purple}${block}\${custom_purple}"
  echo "${custom_red}${block}\${custom_red}"
  echo "${custom_dark_red}${block}\${custom_dark_red}"
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

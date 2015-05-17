#!/usr/bin/env bash

normal=$'\e[00m'
reset_color=$'\e[39m'

black=$'\e[0;30m'
red=$'\e[0;31m'
green=$'\e[0;32m'
yellow=$'\e[0;33m'
blue=$'\e[0;34m'
purple=$'\e[0;35m'
cyan=$'\e[0;36m'
white=$'\e[0;37m'

bold_black=$'\e[1;30m'
bold_red=$'\e[1;31m'
bold_green=$'\e[1;32m'
bold_yellow=$'\e[1;33m'
bold_blue=$'\e[1;34m'
bold_purple=$'\e[1;35m'
bold_cyan=$'\e[1;36m'
bold_white=$'\e[1;37m'

underline_black=$'\e[4;30m'
underline_red=$'\e[4;31m'
underline_green=$'\e[4;32m'
underline_yellow=$'\e[4;33m'
underline_blue=$'\e[4;34m'
underline_purple=$'\e[4;35m'
underline_cyan=$'\e[4;36m'
underline_white=$'\e[4;37m'

background_black=$'\e[40m'
background_red=$'\e[41m'
background_green=$'\e[42m'
background_yellow=$'\e[43m'
background_blue=$'\e[44m'
background_purple=$'\e[45m'
background_cyan=$'\e[46m'
background_white=$'\e[47m'

if tput setaf 1 &> /dev/null; then
  tput sgr0 # reset colors
  custom_reset=$(tput sgr0) || $reset_color
  custom_bold=$(tput bold)
  custom_black=$(tput setaf 0) || $black

  custom_blue=$(tput     setaf $((16#21))) || $blue
  custom_cyan=$(tput     setaf $((16#2b))) || $cyan
  custom_green=$(tput    setaf $((16#1c))) || $green
  custom_orange=$(tput   setaf $((16#a6))) || $yellow
  custom_purple=$(tput   setaf $((16#a2))) || $purple
  custom_red=$(tput      setaf $((16#7c))) || $red
  custom_violet=$(tput   setaf $((16#5c))) || $purple
  custom_yellow=$(tput   setaf $((16#d6))) || $yellow
  custom_white=$(tput    setaf $((16#ff))) || $white
  custom_gray=$(tput     setaf $((16#f0))) || $white
  custom_dark_red=$(tput setaf $((16#34))) || $red
fi

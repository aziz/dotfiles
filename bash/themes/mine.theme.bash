#!/bin/bash

SCM_THEME_PROMPT_DIRTY=" ${bold_red}✘"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✔"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=" "
SCM_NONE_CHAR=""
RVM_THEME_PROMPT_PREFIX="${bold_red}✦ "
RVM_THEME_PROMPT_SUFFIX=" ${reset_color}"
ERROR="${bold_red}🚫 Error \n${normal}"
EXIT_STATUS="if [ \$? = 0 ]; then echo \"\"; else echo \"${ERROR}\"; fi"

rvmrc_version_prompt () {
  if [ -f .rvmrc ] || [ -f .ruby\-version ] || [ -f Gemfile ]; then
    if which rvm &> /dev/null; then
      rvm=$(rvm tools identifier) || return
      clean=${rvm//ruby-/}
      echo -e "$RVM_THEME_PROMPT_PREFIX$clean$RVM_THEME_PROMPT_SUFFIX"
    fi
  fi
}

prompt_right () {
  RIGHT_PROMPT="\033[1;32m$USER\033[0m on \033[1;32m$HOSTNAME\033[0m ● $(date +"%T")\033[0m"
  RIGHT_PROMPT="$(date +"%T")\033[0m"
  echo -e "$(echo ${RIGHT_PROMPT})"
}

prompt_left () {
  LEFT_PROMPT="\[\033[G\]\`${EXIT_STATUS}\`\[${yellow}\]\w \[\$(rvmrc_version_prompt)\]\[${bold_blue}\]\[\$(scm_char)\]\[\$(scm_prompt_info)\]\[${normal}\]\[${reset_color}\]"
  echo -e "${LEFT_PROMPT}"
}

prompt () {
  __iterm_tab_title
  # left, right
  # compensate=4
  # PS1=$(printf "%*s\r%s\n${PS2}" "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")

  PS1=""$(prompt_left)" \@\n${PS2}"
}

PS2="\[${yellow}\]𝌆\[${normal}\]\[${reset_color}\]  "
PROMPT_COMMAND=prompt



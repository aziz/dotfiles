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
  if [ -f .rvmrc ] || [ -f .ruby\-version ] ; then
    if which rvm &> /dev/null; then
      rvm=$(rvm tools identifier) || return
      clean=${rvm//ruby-/}
      echo -e "$RVM_THEME_PROMPT_PREFIX$clean$RVM_THEME_PROMPT_SUFFIX"
    fi
  fi
}

# \[\033[G\]: goto first col
PROMPT="\[\033[G\]\`${EXIT_STATUS}\`\[${bold_yellow}\]\w \[\$(rvmrc_version_prompt)\]\[${bold_blue}\]\[\$(scm_char)\]\[\$(scm_prompt_info)\]\[${normal}\]\[${reset_color}\]\n\[${yellow}\]☰\[${normal}\]\[${reset_color}\]  "

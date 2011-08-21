#!/bin/bash
SCM_THEME_PROMPT_DIRTY=" ${bold_red}✖"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✔"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=" "

PROMPT="\[${bold_yellow}\]\w\[${bold_blue}\] \[\$(scm_char)\]\[\$(scm_prompt_info)\]\[${normal}\]\[${reset_color}\]→ "

# git theming
GIT_THEME_PROMPT_DIRTY=" ${bold_red}✖"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✔"
GIT_THEME_PROMPT_PREFIX=""
GIT_THEME_PROMPT_SUFFIX=""

RVM_THEME_PROMPT_PREFIX=""
RVM_THEME_PROMPT_SUFFIX=""

SCM_NONE_CHAR=''

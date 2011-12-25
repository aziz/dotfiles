#!/bin/bash
SCM_THEME_PROMPT_DIRTY=" ${bold_red}✖"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✔"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=" "

RESET="\[\017\]"
ERROR="${red}⚠ Error \n${normal}"
EXIT_STATUS="if [ \$? = 0 ]; then echo \"\"; else echo \"${ERROR}\"; fi"

#PS1="${RESET}${YELLOW}\h${NORMAL} \`${EXIT_STATUS}\` ${YELLOW}>${NORMAL} "


PROMPT="\[${RESET}\]\`${EXIT_STATUS}\`\[${bold_yellow}\]\w \[\$(rvmrc_version_prompt)\]\[${bold_blue}\]\[\$(scm_char)\]\[\$(scm_prompt_info)\]\[${normal}\]\[${reset_color}\]→ "

# git theming
GIT_THEME_PROMPT_DIRTY=" ${bold_red}✖"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✔"
GIT_THEME_PROMPT_PREFIX=""
GIT_THEME_PROMPT_SUFFIX=""

RVM_THEME_PROMPT_PREFIX="${red}✦ "
RVM_THEME_PROMPT_SUFFIX=" ${reset_color}"

SCM_NONE_CHAR=""

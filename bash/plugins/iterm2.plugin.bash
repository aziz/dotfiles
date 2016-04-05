#!/usr/bin/env bash

# Loading iTerm shell integrations
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Usage:
#   Source this script from your Bash start-up script (eg. ~/.bashrc, ~/.bash_profile).
#
# Setting titles:
#   title something
#   title "more than 1 word"
#
# Setting tab colors:
#   set_iterm_tab_color 195  89  76
#   set_iterm_tab_color 219 154  88
#   set_iterm_tab_color 145 185 104
#   set_iterm_tab_color  92 155 204
#
# Setting pre-defined tab colors:
#   tab_red
#   tab_orange
#   tab_blue
#   tab_green
#
# Setting iterm profile for current tab
#   set_iterm_profile Default
#   set_iterm_profile "My Custom Profile"
#
# Open a new tab a run a command
#   iterm_open_new_tab
#   iterm_open_new_tab "ls;pwd"

__iterm_help_usage() {
  echo "Changes the terminal title"
  echo "Usage:"
  echo "    title mytitle"
  echo "    title \"my long title\""
}

__iterm_help0() {
  echo "ERROR: No argument provided."
  __iterm_help_usage
  return 1
}

__iterm_help2() {
  echo "ERROR: Too many arguments provided."
  __iterm_help_usage
  return 1
}

iterm_open_new_tab() {
  osascript <<EOF
  tell application "iTerm"
    tell current window
      set newTab to (create tab with default profile)
      tell newTab
        tell current session
          write text "$*"
        end tell
      end tell
    end tell
  end tell
EOF
}

__iterm_tab_title () {
  if [ -z "$ITERM_TAB_TITLE" ]; then
    echo -ne '\033]0;'${PWD##*/}'\007'
  else
    echo -ne '\033]0;'$ITERM_TAB_TITLE'\007'
  fi
}

# Set iTerm tab/window name to the current directory
set_iterm_tab_title() {
  if [ $# -eq 0 ]
  then
    __iterm_help0;
  elif [ $# -eq 1 ]
  then
    export ITERM_TAB_TITLE=$1
  elif [ $# -gt 1 ]
  then
    __iterm_help2;
  fi
}
alias title=set_iterm_tab_title

set_iterm_profile() {
  if [ $# -eq 0 ]
  then
    __iterm_help0;
  elif [ $# -eq 1 ]
  then
    echo -e "\033]50;SetProfile=$1\a"
  elif [ $# -gt 1 ]
  then
    __iterm_help2;
  fi
}

iterm_cursor_line()  { echo -ne "\033]50;CursorShape=1\a"; }
iterm_cursor_solid() { echo -ne "\033]50;CursorShape=0\a"; }
alias icl=iterm_cursor_line
alias icb=iterm_cursor_solid

titlepwd() { set_iterm_tab_title "$(pwd)"; }

set_iterm_tab_color() {
  echo -n -e "\033]6;1;bg;red;brightness;$1\a"
  echo -n -e "\033]6;1;bg;green;brightness;$2\a"
  echo -n -e "\033]6;1;bg;blue;brightness;$3\a"
}

tab_alice_blue() { set_iterm_tab_color 240 248 255; }
tab_antique_white() { set_iterm_tab_color 250 235 215; }
tab_aqua() { set_iterm_tab_color 0 255 255; }
tab_aqua_marine() { set_iterm_tab_color 127 255 212; }
tab_azure() { set_iterm_tab_color 240 255 255; }
tab_beige() { set_iterm_tab_color 245 245 220; }
tab_bisque() { set_iterm_tab_color 255 228 196; }
tab_black() { set_iterm_tab_color 0 0 0; }
tab_blanched_almond() { set_iterm_tab_color 255 235 205; }
tab_blue_violet() { set_iterm_tab_color 138 43 226; }
tab_brown() { set_iterm_tab_color 165 42 42; }
tab_burly_wood() { set_iterm_tab_color 222 184 135; }
tab_cadet_blue() { set_iterm_tab_color 95  158 160; }
tab_chart_reuse() { set_iterm_tab_color 127 255 0; }
tab_chocolate() { set_iterm_tab_color 210 105 30; }
tab_coral() { set_iterm_tab_color 255 127 80; }
tab_corn_flower_blue() { set_iterm_tab_color 100 149 237; }
tab_corn_silk() { set_iterm_tab_color 255 248 220; }
tab_crimson() { set_iterm_tab_color 220 20 60; }
tab_cyan() { set_iterm_tab_color 0 255 255; }
tab_dark_blue() { set_iterm_tab_color 0 0 139; }
tab_dark_cyan() { set_iterm_tab_color 0 139 139; }
tab_dark_golden_rod() { set_iterm_tab_color 184 134 11; }
tab_dark_gray_dark_grey() { set_iterm_tab_color 169 169 169; }
tab_dark_green() { set_iterm_tab_color 0 100 0; }
tab_dark_khaki() { set_iterm_tab_color 189 183 107; }
tab_dark_magenta() { set_iterm_tab_color 139 0 139; }
tab_dark_olive_green() { set_iterm_tab_color 85  107 47; }
tab_dark_orange() { set_iterm_tab_color 255 140 0; }
tab_dark_orchid() { set_iterm_tab_color 153 50 204; }
tab_dark_red() { set_iterm_tab_color 139 0 0; }
tab_dark_salmon() { set_iterm_tab_color 233 150 122; }
tab_dark_sea_green() { set_iterm_tab_color 143 188 143; }
tab_dark_slate_blue() { set_iterm_tab_color 72  61 139; }
tab_dark_slate_gray() { set_iterm_tab_color 47  79 79; }
tab_dark_turquoise() { set_iterm_tab_color 0 206 209; }
tab_dark_violet() { set_iterm_tab_color 148 0 211; }
tab_deep_pink() { set_iterm_tab_color 255 20 147; }
tab_deep_sky_blue() { set_iterm_tab_color 0 191 255; }
tab_dim_gray_dim_grey() { set_iterm_tab_color 105 105 105; }
tab_dodger_blue() { set_iterm_tab_color 30  144 255; }
tab_firebrick() { set_iterm_tab_color 178 34 34; }
tab_floral_white() { set_iterm_tab_color 255 250 240; }
tab_forest_green() { set_iterm_tab_color 34  139 34; }
tab_gainsboro() { set_iterm_tab_color 220 220 220; }
tab_ghost_white() { set_iterm_tab_color 248 248 255; }
tab_gold() { set_iterm_tab_color 255 215 0; }
tab_golden_rod() { set_iterm_tab_color 218 165 32; }
tab_gray_grey() { set_iterm_tab_color 128 128 128; }
tab_green_yellow() { set_iterm_tab_color 173 255 47; }
tab_honeydew() { set_iterm_tab_color 240 255 240; }
tab_hot_pink() { set_iterm_tab_color 255 105 180; }
tab_indian_red() { set_iterm_tab_color 205 92 92; }
tab_indigo() { set_iterm_tab_color 75  0 130; }
tab_ivory() { set_iterm_tab_color 255 255 240; }
tab_khaki() { set_iterm_tab_color 240 230 140; }
tab_lavender() { set_iterm_tab_color 230 230 250; }
tab_lavender_blush() { set_iterm_tab_color 255 240 245; }
tab_lawn_green() { set_iterm_tab_color 124 252 0; }
tab_lemon_chiffon() { set_iterm_tab_color 255 250 205; }
tab_light_blue() { set_iterm_tab_color 173 216 230; }
tab_light_coral() { set_iterm_tab_color 240 128 128; }
tab_light_cyan() { set_iterm_tab_color 224 255 255; }
tab_light_golden_rod_yellow() { set_iterm_tab_color 250 250 210; }
tab_light_gray_light_grey() { set_iterm_tab_color 211 211 211 ; }
tab_light_green() { set_iterm_tab_color 144 238 144; }
tab_light_pink() { set_iterm_tab_color 255 182 193; }
tab_light_salmon() { set_iterm_tab_color 255 160 122; }
tab_light_sea_green() { set_iterm_tab_color 32  178 170; }
tab_light_sky_blue() { set_iterm_tab_color 135 206 250; }
tab_light_slate_gray() { set_iterm_tab_color 119 136 153; }
tab_light_steel_blue() { set_iterm_tab_color 176 196 222; }
tab_light_yellow() { set_iterm_tab_color 255 255 224; }
tab_lime() { set_iterm_tab_color 0 255 0; }
tab_lime_green() { set_iterm_tab_color 50  205 50; }
tab_linen() { set_iterm_tab_color 250 240 230; }
tab_magenta_fuchsia() { set_iterm_tab_color 255 0 255; }
tab_maroon() { set_iterm_tab_color 128 0 0; }
tab_medium_aqua_marine() { set_iterm_tab_color 102 205 170; }
tab_medium_blue() { set_iterm_tab_color 0 0 205; }
tab_medium_orchid() { set_iterm_tab_color 186 85_ 211; }
tab_medium_purple() { set_iterm_tab_color 147 112 219; }
tab_medium_sea_green() { set_iterm_tab_color 60  179 113; }
tab_medium_slate_blue() { set_iterm_tab_color 123 104 238; }
tab_medium_spring_green() { set_iterm_tab_color 0 250 154; }
tab_medium_turquoise() { set_iterm_tab_color 72  209 204; }
tab_medium_violet_red() { set_iterm_tab_color 199 21 133; }
tab_midnight_blue() { set_iterm_tab_color 25  25_ 112; }
tab_mint_cream() { set_iterm_tab_color 245 255 250; }
tab_misty_rose() { set_iterm_tab_color 255 228 225; }
tab_moccasin() { set_iterm_tab_color 255 228 181; }
tab_navajo_white() { set_iterm_tab_color 255 222 173; }
tab_navy() { set_iterm_tab_color 0 0 128; }
tab_old_lace() { set_iterm_tab_color 253 245 230; }
tab_olive() { set_iterm_tab_color 128 128 0; }
tab_olive_drab() { set_iterm_tab_color 107 142 35; }
tab_orange_red() { set_iterm_tab_color 255 69 0; }
tab_orchid() { set_iterm_tab_color 218 112 214; }
tab_pale_golden_rod() { set_iterm_tab_color 238 232 170; }
tab_pale_green() { set_iterm_tab_color 152 251 152; }
tab_pale_turquoise() { set_iterm_tab_color 175 238 238; }
tab_pale_violet_red() { set_iterm_tab_color 219 112 147; }
tab_papaya_whip() { set_iterm_tab_color 255 239 213; }
tab_peach_puff() { set_iterm_tab_color 255 218 185; }
tab_peru() { set_iterm_tab_color 205 133 63; }
tab_pink() { set_iterm_tab_color 255 192 203; }
tab_plum() { set_iterm_tab_color 221 160 221; }
tab_powder_blue() { set_iterm_tab_color 176 224 230; }
tab_purple() { set_iterm_tab_color 128 0 128; }
tab_rosy_brown() { set_iterm_tab_color 188 143 143; }
tab_royal_blue() { set_iterm_tab_color 65  105 225; }
tab_saddle_brown() { set_iterm_tab_color 139 69 19; }
tab_salmon() { set_iterm_tab_color 250 128 114; }
tab_sandy_brown() { set_iterm_tab_color 244 164 96; }
tab_sea_green() { set_iterm_tab_color 46  139 87; }
tab_sea_shell() { set_iterm_tab_color 255 245 238; }
tab_sienna() { set_iterm_tab_color 160 82 45; }
tab_silver() { set_iterm_tab_color 192 192 192; }
tab_sky_blue() { set_iterm_tab_color 135 206 235; }
tab_slate_blue() { set_iterm_tab_color 106 90 205; }
tab_slate_gray() { set_iterm_tab_color 112 128 144; }
tab_snow() { set_iterm_tab_color 255 250 250; }
tab_spring_green() { set_iterm_tab_color 0 255 127; }
tab_steel_blue() { set_iterm_tab_color 70  130 180; }
tab_tan() { set_iterm_tab_color 210 180 140; }
tab_teal() { set_iterm_tab_color 0 128 128; }
tab_thistle() { set_iterm_tab_color 216 191 216; }
tab_tomato() { set_iterm_tab_color 255 99 71; }
tab_turquoise() { set_iterm_tab_color 64  224 208; }
tab_violet() { set_iterm_tab_color 238 130 238; }
tab_wheat() { set_iterm_tab_color 245 222 179; }
tab_white() { set_iterm_tab_color 255 255 255; }
tab_white_smoke() { set_iterm_tab_color 245 245 245; }
tab_yellow_green() { set_iterm_tab_color 154 205 50; }

# Pure colors to be overridden later
tab_pure_red()    { set_iterm_tab_color 255   0   0; }
tab_pure_orange() { set_iterm_tab_color 255 165   0; }
tab_pure_green()  { set_iterm_tab_color   0 128   0; }
tab_pure_blue()   { set_iterm_tab_color   0   0 255; }
tab_pure_yellow() { set_iterm_tab_color 255 255   0; }

# Overridden colors
tab_red()    { set_iterm_tab_color 195  89  76; }
tab_orange() { set_iterm_tab_color 219 154  88; }
tab_green()  { set_iterm_tab_color  65 174  76; }
tab_blue()   { set_iterm_tab_color  92 155 204; }
tab_yellow() { set_iterm_tab_color 240 240   0; }


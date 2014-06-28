# Usage:
#   Source this script from your Bash start-up script (eg. ~/.bashrc, ~/.bash_profile).
#
# Setting titles:
#   title something
#   title "more than 1 word"
#
# Setting tab colors:
#   tab_color 195  89  76
#   tab_color 219 154  88
#   tab_color 145 185 104
#   tab_color  92 155 204
#
# Setting pre-defined tab colors:
#   tab_red
#   tab_orange
#   tab_blue
#   tab_green

# Set iTerm tab/window name to the current directory
export PROMPT_COMMAND="echo -ne \"\033]0;${PWD##*/}\007\""

title_help0()
{
echo "ERROR: No argument provided."
echo "Usage:"
echo "  `basename $0` \"title\" to provide a new Terminal title."
}

title_help2()
{
echo "ERROR: Too many arguments provided."
echo "Usage:"
echo "  `basename $0` \"title\" to provide a new Terminal title."
}

function set_iterm_title() {
if [ $# -eq 0 ]
then
  title_help0;
elif [ $# -eq 1 ]
then
  export PROMPT_COMMAND="echo -ne '\033]0;'$1'\007'"
elif [ $# -gt 1 ]
then
  title_help2;
fi
}
alias title='set_iterm_title'

function titlepwd() {
  set_iterm_title `pwd`
}

function tab_maroon {  tab_color 128 0 0; }
function tab_dark_red {  tab_color 139 0 0; }
function tab_brown {  tab_color 165 42 42; }
function tab_firebrick {  tab_color 178 34 34; }
function tab_crimson {  tab_color 220 20 60; }
function tab_tomato {  tab_color 255 99 71; }
function tab_coral {  tab_color 255 127 80; }
function tab_indian_red {  tab_color 205 92 92; }
function tab_light_coral {  tab_color 240 128 128; }
function tab_dark_salmon {  tab_color 233 150 122; }
function tab_salmon {  tab_color 250 128 114; }
function tab_light_salmon {  tab_color 255 160 122; }
function tab_orange_red {  tab_color 255 69 0; }
function tab_dark_orange {  tab_color 255 140 0; }
function tab_gold {  tab_color 255 215 0; }
function tab_dark_golden_rod {  tab_color 184 134 11; }
function tab_golden_rod {  tab_color 218 165 32; }
function tab_pale_golden_rod {  tab_color 238 232 170; }
function tab_dark_khaki {  tab_color 189 183 107; }
function tab_khaki {  tab_color 240 230 140; }
function tab_olive {  tab_color 128 128 0; }
function tab_yellow_green {  tab_color 154 205 50; }
function tab_dark_olive_green {  tab_color 85  107 47; }
function tab_olive_drab {  tab_color 107 142 35; }
function tab_lawn_green {  tab_color 124 252 0; }
function tab_chart_reuse {  tab_color 127 255 0; }
function tab_green_yellow {  tab_color 173 255 47; }
function tab_dark_green {  tab_color 0 100 0; }
function tab_forest_green {  tab_color 34  139 34; }
function tab_lime {  tab_color 0 255 0; }
function tab_lime_green {  tab_color 50  205 50; }
function tab_light_green {  tab_color 144 238 144; }
function tab_pale_green {  tab_color 152 251 152; }
function tab_dark_sea_green {  tab_color 143 188 143; }
function tab_medium_spring_green {  tab_color 0 250 154; }
function tab_spring_green {  tab_color 0 255 127; }
function tab_sea_green {  tab_color 46  139 87; }
function tab_medium_aqua_marine {  tab_color 102 205 170; }
function tab_medium_sea_green {  tab_color 60  179 113; }
function tab_light_sea_green {  tab_color 32  178 170; }
function tab_dark_slate_gray {  tab_color 47  79 79; }
function tab_teal {  tab_color 0 128 128; }
function tab_dark_cyan {  tab_color 0 139 139; }
function tab_aqua {  tab_color 0 255 255; }
function tab_cyan {  tab_color 0 255 255; }
function tab_light_cyan {  tab_color 224 255 255; }
function tab_dark_turquoise {  tab_color 0 206 209; }
function tab_turquoise {  tab_color 64  224 208; }
function tab_medium_turquoise {  tab_color 72  209 204; }
function tab_pale_turquoise {  tab_color 175 238 238; }
function tab_aqua_marine {  tab_color 127 255 212; }
function tab_powder_blue {  tab_color 176 224 230; }
function tab_cadet_blue {  tab_color 95  158 160; }
function tab_steel_blue {  tab_color 70  130 180; }
function tab_corn_flower_blue {  tab_color 100 149 237; }
function tab_deep_sky_blue {  tab_color 0 191 255; }
function tab_dodger_blue {  tab_color 30  144 255; }
function tab_light_blue {  tab_color 173 216 230; }
function tab_sky_blue {  tab_color 135 206 235; }
function tab_light_sky_blue {  tab_color 135 206 250; }
function tab_midnight_blue {  tab_color 25  25_ 112; }
function tab_navy {  tab_color 0 0 128; }
function tab_dark_blue {  tab_color 0 0 139; }
function tab_medium_blue {  tab_color 0 0 205; }
function tab_royal_blue {  tab_color 65  105 225; }
function tab_blue_violet {  tab_color 138 43 226; }
function tab_indigo {  tab_color 75  0 130; }
function tab_dark_slate_blue {  tab_color 72  61 139; }
function tab_slate_blue {  tab_color 106 90 205; }
function tab_medium_slate_blue {  tab_color 123 104 238; }
function tab_medium_purple {  tab_color 147 112 219; }
function tab_dark_magenta {  tab_color 139 0 139; }
function tab_dark_violet {  tab_color 148 0 211; }
function tab_dark_orchid {  tab_color 153 50 204; }
function tab_medium_orchid {  tab_color 186 85_ 211; }
function tab_purple {  tab_color 128 0 128; }
function tab_thistle {  tab_color 216 191 216; }
function tab_plum {  tab_color 221 160 221; }
function tab_violet {  tab_color 238 130 238; }
function tab_magenta_fuchsia {  tab_color 255 0 255; }
function tab_orchid {  tab_color 218 112 214; }
function tab_medium_violet_red {  tab_color 199 21 133; }
function tab_pale_violet_red {  tab_color 219 112 147; }
function tab_deep_pink {  tab_color 255 20 147; }
function tab_hot_pink {  tab_color 255 105 180; }
function tab_light_pink {  tab_color 255 182 193; }
function tab_pink {  tab_color 255 192 203; }
function tab_antique_white {  tab_color 250 235 215; }
function tab_beige {  tab_color 245 245 220; }
function tab_bisque {  tab_color 255 228 196; }
function tab_blanched_almond {  tab_color 255 235 205; }
function tab_wheat {  tab_color 245 222 179; }
function tab_corn_silk {  tab_color 255 248 220; }
function tab_lemon_chiffon {  tab_color 255 250 205; }
function tab_light_golden_rod_yellow {  tab_color 250 250 210; }
function tab_light_yellow {  tab_color 255 255 224; }
function tab_saddle_brown {  tab_color 139 69 19; }
function tab_sienna {  tab_color 160 82 45; }
function tab_chocolate {  tab_color 210 105 30; }
function tab_peru {  tab_color 205 133 63; }
function tab_sandy_brown {  tab_color 244 164 96; }
function tab_burly_wood {  tab_color 222 184 135; }
function tab_tan {  tab_color 210 180 140; }
function tab_rosy_brown {  tab_color 188 143 143; }
function tab_moccasin {  tab_color 255 228 181; }
function tab_navajo_white {  tab_color 255 222 173; }
function tab_peach_puff {  tab_color 255 218 185; }
function tab_misty_rose {  tab_color 255 228 225; }
function tab_lavender_blush {  tab_color 255 240 245; }
function tab_linen {  tab_color 250 240 230; }
function tab_old_lace {  tab_color 253 245 230; }
function tab_papaya_whip {  tab_color 255 239 213; }
function tab_sea_shell {  tab_color 255 245 238; }
function tab_mint_cream {  tab_color 245 255 250; }
function tab_slate_gray {  tab_color 112 128 144; }
function tab_light_slate_gray {  tab_color 119 136 153; }
function tab_light_steel_blue {  tab_color 176 196 222; }
function tab_lavender {  tab_color 230 230 250; }
function tab_floral_white {  tab_color 255 250 240; }
function tab_alice_blue {  tab_color 240 248 255; }
function tab_ghost_white {  tab_color 248 248 255; }
function tab_honeydew {  tab_color 240 255 240; }
function tab_ivory {  tab_color 255 255 240; }
function tab_azure {  tab_color 240 255 255; }
function tab_snow {  tab_color 255 250 250; }
function tab_black {  tab_color 0 0 0; }
function tab_dim_gray_dim_grey {  tab_color 105 105 105; }
function tab_gray_grey {  tab_color 128 128 128; }
function tab_dark_gray_dark_grey {  tab_color 169 169 169; }
function tab_silver {  tab_color 192 192 192; }
function tab_light_gray_light_grey {  tab_color 211 211 211 ; }
function tab_gainsboro {  tab_color 220 220 220; }
function tab_white_smoke {  tab_color 245 245 245; }
function tab_white {  tab_color 255 255 255; }

# Pure colors to be overridden later
function tab_pure_red {  tab_color 255 0 0; }
function tab_pure_orange {  tab_color 255 165 0; }
function tab_pure_green {  tab_color 0 128 0; }
function tab_pure_blue {  tab_color 0 0 255; }
function tab_pure_yellow {  tab_color 255 255 0; }

# Overridden colors
function tab_red()    {  tab_color 195  89  76; }
function tab_orange() {  tab_color 219 154  88; }
function tab_green()  {  tab_color  65 174  76; }
function tab_blue()   {  tab_color  92 155 204; }
function tab_yellow() {  tab_color 240 240   0; }

function tab_color() {
  echo -n -e "\033]6;1;bg;red;brightness;$1\a"
  echo -n -e "\033]6;1;bg;green;brightness;$2\a"
  echo -n -e "\033]6;1;bg;blue;brightness;$3\a"
}

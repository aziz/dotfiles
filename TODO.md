install 
- pow
- automatically install mac apps from app-store??

# TODO: 
- https://github.com/xiongchiamiov/terminal-screensaver
- https://github.com/cowboy/dotfiles
- compile npmrc on install just like gitconfig
- github.com/nesono/nesono-bin/blob/master/bashtils/rm2trash.linux

# BUGS 
- fix usage function in mac
- hcht configuration

# LINUX (WIP):
- f does not work
- pman does not work
- browser does not work
- seq on linux should not override original command (rename it to my_seq and alias it on mac)
- aliases for apt-get and apt-cache search on linux
- taskrc location does not work in linux
- load grc under linux

# VIM
- http://vim.spf13.com/#install
- https://github.com/zaiste/vimified
- use vundle or pathogen
- https://github.com/mutewinter/dot_vim
- vim: clean up colors
- add vim powerline: https://github.com/Lokaltog/vim-powerline

# FEATURE REQUESTS
- different prompt on server \u@\h in green with cloud icon
- dropbox linking
- merge bash/aliases and bash/plugin into topic related files/folders. things that add functionality or configure an already installed app should be called plugins. plugins can have aliases/functions/exports/completions/help. Others should be stored as pure bash scripts called something else!

# AUTO INSTALL UTILS
## prepare_linux.shell:

    # to fix a warning in running chrome and sublime from console
    sudo apt-get install gtk2-engines-pixbuf
    # to have pbpaste and pbcopy aliases to work
    sudo apt-get install xclip

## prepare_mac.shell
    # add rmtrash to delete to trash
    brew rmtrash

local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
if [ $SSH2_IP ] || [ $SSH_IP ] ; then
  local SSH_FLAG="@\h"
fi
        
    |- plugins
    |   |--- exports
    |   |--- aliases
    |   |--- functions
    |   |--- completion
    |- themes
    |- tools
    |- bin (other langs useful scripts)

> signle letter aliases available:    
> AIJMNOPY

______________________________________________

     ✔ ✖ ✘ ✚ ✕ 
     → ➞ ➔ ➜ ➤ ⬆ ⬇ ⬅ ▷ ▽ ▸ ▹ ► ◀ ▲ ▼ ▾ ‣
     ★ ☆ ✩ ✱ ✸ ❉ ✿ ፨ ※ ⁜ ⚙  ✜ ✪ ✦ ◈ ⟐   
     ⛁ ⛃ ⚑ ⚐ ✆ ✈ ⚠ ⚡ ♪ ♫ ⑆ ❣ ❞ ❝  
     ☼ ☀ ☁ ☂ ⚓ ☛ ♻ ♺ ❤ ☯ ☗ ♞ ♛ ♚ ☎ ♨
     ⌘ ⌥ ⌦ ⌫ ↵ ↩ ⇧ ⎋ ⏎ ⎈ ⏏
     ▢  ▣ ▤ ▩ ▦ ■ ■ ▪ □ ▫ ☐☑☒⊞
     ǁ ǂ ʭ Ξ ︴ ┋ ┊ ┇ ┆ ⣿ ⁞ ⡇ ≡ ≣ ⑉ ∵ ∴ ෴
     ⊲ ⊳  ❮ ❯ ‹ › ⟨ ⟩ ⟪ ⟫ ⎨ ⎬ ❪ ❫〔 〕
     ⊕ ⊝ ⊜ ⊗ ⊙ ⊚  ⦿ ⨂ ⨁ ♾ ⨀ ○ ◉ 〇 ◌ ◍ • ●
     〓 █ ▇ ▇ ▇ ▆ ▅ ▅ ▄ ▃ ▂ ▁ ▀▗ ▖ ▘ ▙ ▚ ▛ ▜ ◹ ◺ ◸ ◿
     ➊➋➌➍➎➏➐➑➒➓ ➀➁➂➃➄➅➆➇➈➉ ¹²³⁴⁵⁶⁷⁸⁹⁰ 
     ☰ ䷀ 𝌆 𝍖 𝌮 



# Best Separators:
    —✿—✿—✿—✿—✿—✿—✿—✿—✿—✿—✿—✿—✿—✿—✿—
    ☙————————————————————————————❧
    -∙-∙-∙-∙-∙-∙-∙-∙-∙-∙-∙-∙-∙-∙-∙
    ✄----------------------------
    ༻〰〰〰〰〰〰〰〰〰〰〰〰〰〰༺
    ﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌
    ﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋﹋ 
    ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
    ⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘⁘
    ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
    •°°°•.•°°°•.•°°°•.•°°°•.•°°°• 
    ..:::::.✸.:::::.. 

    ┌───┬───────┐
    │   │       │
    ├───┼───────┤
    │   │       │
    │   │       │
    └───┴───────┘
    ┏━━━┳━━━━━━━┓
    ┃   ┃       ┃
    ┣━━━╋━━━━━━━┫
    ┃   ┃       ┃
    ┗━━━┻━━━━━━━┛
    ╭───────────╮
    ├───────────┤
    ╰───────────╯
    ╔═════╦═════╗
    ║     ║     ║
    ╠═════╬═════╣
    ║     ║     ║
    ╚═════╩═════╝

# Not Safe in Linux:
    𐄂 ⸭  ⧆ ⧇ ︙⦀ ⦂ ⦙ ⦚ ⧘ ⧙ ⧚ ⧛ ⪡ ⪢ ⪦ ⪧ ⫏ ⫐ ⫷ ⫸ ⦉ ⦊ ⦗ ⦘ ⦼ ⧀ ⧁ ⨠
    ⿳ ⿰ ⿱ ⿲ ⿳ ⿴ ⿵ ⿶ ⿷ ⿸ ⿹ ⿺ ⿻

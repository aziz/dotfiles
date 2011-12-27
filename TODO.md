- aliases for apt-get and apt-cache search on linux
- different prompt on server \u@\h in green with cloud icon
- fix usage function in mac
- grc should load in mac with brew

- merge bash/aliases and bash/plugin into topic related files/folders
- things that add functionality or configure an already installed app should be called plugins.
- plugins can have aliases/functions/exports/completions/help
- others should be stored as pure bash scripts called ???
- hcht configuration
- https://github.com/nesono/nesono-bin/blob/master/bashtils/rm2trash.linux
- https://github.com/nesono/nesono-bin/blob/master/bashtils/rm2trash.darwin
- dropbox linking
- prepare_linux.shell
- prepare_mac.shell

- use vundle
- https://github.com/mutewinter/dot_vim
- vim: clean up colors

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

---------------------------------
signle letter aliases available:
IJMNOPTY
---------------------------------
# ✔ ✖ ✘ ✚ 𐄂 ✕
# → ➞ ➔ ➜ ➤ ⬆ ⬇ ⬅  ▷▽▸▹  ► ◀ ▲ ▼  ▾ ‣
# ★ ☆ ✩ ✱ ✸ ❉ ✿ ✦ ✜ ✪ ◈ ⟐
# ⚑ ⚐ ✆ ✈  ⚠ ⚡ ♪ ♫ ⑆ ⑉
# ☼ ☀ ☁ ☂ ⚓ ☛ ♻ ❤ ☯ ☗ ♞ ⏰ ♛ ♚ ☎ ♨
# ⌘ ⌥  ⌦ ⌫ ↵ ↩ ⇧  ⎋ ⏎ ⎈
# ▢ ▣ ▦ ⧆ ⧇ ■■▪ □▫ ☐
# ǁ ǂ ʭ Ξ ⣿ ⡇ ⦀⦂ ⦙⦚ ⧘⧙⧚⧛ ≡
# ⪡ ⪢ ⪦⪧ ⫏⫐ ⊲ ⊳ ⫷ ⫸ ❮❯ ‹› ⟨⟩ ⟪⟫ ⦉⦊ ⦗⦘ ⎨⎬ ❪❫〔 〕
# ⊕ ⊝ ⊜ ⊗ ⊙ ⊚ ⦼ ⧀ ⦿ ⧁ ⨂ ⨁ ⨀ ○  ◉ ◌ ◍ • ●
# 〓 █  ▇▇▇▆▅▅▄▃▂▁▀▗▖▘▙▚▛▜ ◹ ◺ ◸ ◿

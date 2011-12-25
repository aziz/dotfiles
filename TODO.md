- different prompt on server \u@\h in green with cloud icon
- fix usage in mac
- grc should load in mac with brew
- find equivalent of brew commands
- vim: Cannot find color scheme solarized
- bash_completion in linux
- hg repo info bug

- clean up bash-it.bash and bash_profile, merge all exports and sources
- merge bash/aliases and bash/plugin into topic related files/folders
- things that add functionality or configure an already installed app should be called plugins.
- plugins can have aliases/functions/exports/completions/help
- others should be stored as pure bash scripts called ???
- https://github.com/holman/dotfiles/
- apache plugin
- hcht configuration
- growl notify the result of brew update
- rm2trash is broken for linux
- https://github.com/nesono/nesono-bin/blob/master/bashtils/rm2trash.linux
- https://github.com/nesono/nesono-bin/blob/master/bashtils/rm2trash.darwin
- dropbox linking
- prepare_linux.shell
- prepare_mac.shell

local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
if [ $SSH2_IP ] || [ $SSH_IP ] ; then
  local SSH_FLAG="@\h"
fi

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder
chflags nohidden ~/Library

#pbcopy and pbpaste aliases for GNU/Linux
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

#readline
while IFS= read -r line; do
echo "$line"
done < somefile.txt

---------------------------------

# ✔ ✖ ✘ ✚ 𐄂
# → ➞ ➜ ➤ ⬆ ⬇ ⬅  ▷▸▹  ► ◀ ▲ ▼ ‣ ›
# ★ ☆ ✩ ✱ ✸ ✿ ✦ ✜  ◈ ⟐
# ⚑ ⚐ ✆ ✈  ⚠ ⚡ ♪ ♫ ⑆ ⑉
# ☼ ☀ ☁ ☂ ⚓ ☛ ♻ ❤ ☯ ☗ ♞ ⏰ ♛
# ⌘ ⌥  ⌦  ⌫ ↵ ↩ ⇧ ⎋ ⏎ ⎈
# ▢ ▣ ▦ ⧆ ⧇ ■■▪ □▫ ☐
# ǁ ǂ ʭ Ξ ⣿ ⡇ ⦀⦂ ⦙⦚ ⧘⧙⧚⧛
# ⪡ ⪢ ⪦⪧ ⫏⫐ ⊲ ⊳ ⫷ ⫸ ❮❯ ‹›⟨⟩⟪⟫ ⦉⦊ ⦗⦘ ⎨⎬❪❫〔 〕
# ⊕ ⊝ ⊜ ⊗ ⊙ ⊚ ⦼ ⧀ ⦿ ⧁ ⨂ ⨁ ⨀ ○  ◉ ◌ ◍ • ●
# 〓 █  ▇▇▇▆▅▅▄▃▂▁▀▗▖▘▙▚▛▜ ◹ ◺ ◸ ◿

plugins
|--- exports
|--- aliases
|--- functions
|--- completion

themes
tools

bin (other langs useful scripts)

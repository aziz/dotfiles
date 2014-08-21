complete -C aws_completer aws

if [ -f $(brew --prefix)/etc/profile.d/credulous.sh ]; then
    . "$(brew --prefix)"/etc/profile.d/credulous.sh
fi

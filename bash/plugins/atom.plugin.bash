#!/usr/bin/env bash

alias apmup='apm update -c false && atom_save_packages'

atom_packages_file="$HOME/.templates/dependencies/atom"
vscode_extensions_file="$HOME/.templates/dependencies/vscode"

atom_save_packages() {
  apm list --installed --bare | grep -v .bin | grep -v '^$' | sort --ignore-case | sed -E 's/@.+$//g' > "$atom_packages_file"
}

atom_restore_packages() {
  apm install --packages-file "$atom_packages_file"
}

vscode_save_packages() {
  code --list-extensions > "$vscode_extensions_file"
}

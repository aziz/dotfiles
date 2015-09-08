#!/usr/bin/env bash

atom_save_packages() {
  apm list --installed --bare | grep -v .bin | grep -v '^$' | sort --ignore-case > "$HOME"/.atom/packages.txt
}

atom_restore_packages() {
  apm install --packages-file "$HOME"/.atom/packages.txt
}

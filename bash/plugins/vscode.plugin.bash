#!/usr/bin/env bash

vscode_extensions_file="$HOME/.templates/dependencies/vscode"

vscode_save_packages() {
  code --list-extensions > "$vscode_extensions_file"
}

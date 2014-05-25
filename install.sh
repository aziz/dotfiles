#!/bin/bash

clear
echo "      _       _    __ _ _             "
echo "     | |     | |  / _(_) |            "
echo "   __| | ___ | |_| |_ _| | ___  ___   "
echo "  / _\` |/ _ \| __|  _| | |/ _ \/ __|  "
echo " | (_| | (_) | |_| | | | |  __/\__ \  "
echo "(_)__,_|\___/ \__|_| |_|_|\___||___/  "
echo "______________________________________________"
echo
echo "Installing dotfiles into your home directory"
echo

backup_dir=".backup_old_dot_files"

for name in *; do

  target="$HOME/.$name"

  if [[ $name != 'install.sh' && $name != 'README.md' && $name != 'gitconfig' && $name != 'TODO.md' ]]; then

    if [ -e $target ]; then
      if [ ! -L $target ]; then
        echo "backing up .$name in $HOME/$backup_dir/ directory"
        if [ ! -d "$HOME/$backup_dir" ]; then
          mkdir -p "$HOME/$backup_dir"
        fi
        cp "$target" "$HOME/$backup_dir/.$name"
        rm -rf "$target"
      else
        rm -rf "$target"
      fi
    fi

    echo "Creating .$name"
    ln -s "$PWD/$name" "$target"
  fi

done

# Handling gitconfig
function generate_gitconfig() {
  read -p "Your Name: " name
  read -p "Your Email: " email
  read -p "Github Username: " gh_username
  cat gitconfig | sed 's/${name}/'"$name"'/' | sed 's/${email}/'"$email"'/' | sed 's/${gh_username}/'"$gh_username"'/' > "$HOME/.gitconfig"
}

function backup_gitconfig() {
  if [ ! -d "$HOME/$backup_dir" ]; then
    mkdir -p "$HOME/$backup_dir"
  fi
  cp "$HOME/.gitconfig" "$HOME/$backup_dir/.gitconfig";
}

echo "Creating .gitconfig"
if [ -e "$HOME/.gitconfig" ]; then
  read -p "overwirte .gitconfig? [y=Yes; n=No; b=Backup then Overwrite]" yn
  case $yn in
      [Yy]* ) rm -rf "$HOME/.gitconfig";generate_gitconfig;;
      [Nn]* ) echo ".gitconfig ignored";;
      [Bb]* ) backup_gitconfig; rm -rf "$HOME/.gitconfig";generate_gitconfig;;
      * ) echo ".gitconfig ignored";;
  esac
else
  generate_gitconfig
fi

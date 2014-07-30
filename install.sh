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

  # ignore *.md and *.sh files and some other that need post processing
  if [[ ${name: -3} != ".sh" && ${name: -3} != ".md" && $name != 'gitconfig' && $name != 'npmrc' ]]; then
    # check if file already exists
    if [ -e "$target" ]; then
      # check if file is a symlink.
      # if it is symlink we just delete it
      # if it's a real file we back it up
      if [ ! -L "$target" ]; then
        # create backup dir if it's not there
        if [ ! -d "$HOME/$backup_dir" ]; then
          mkdir -p "$HOME/$backup_dir"
        fi
        echo "Backing up .$name in $HOME/$backup_dir/ directory"
        cp "$target" "$HOME/$backup_dir/.$name"
      fi
      rm -rf "$target"
    fi

    echo "Creating .$name"
    ln -s "$PWD/$name" "$target"
  fi

done

# Handling gitconfig
generate_gitconfig () {
  read -p "Your Name: " name
  read -p "Your Email: " email
  read -p "Github Username: " gh_username
  cat gitconfig | sed 's/${name}/'"$name"'/' | sed 's/${email}/'"$email"'/' | sed 's/${gh_username}/'"$gh_username"'/' > "$HOME/.gitconfig"
}

backup_gitconfig () {
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
      [Bb]* ) backup_gitconfig; rm -rf "$HOME/.gitconfig";generate_gitconfig;;
      [Nn]* ) echo ".gitconfig ignored";;
          * ) echo ".gitconfig ignored";;
  esac
else
  generate_gitconfig
fi


# Handling npmrc
generate_npmrc () {
  read -p "Your Name: " name
  read -p "Your Email: " email
  read -p "Github Username: " gh_username
  read -p "NPM Username: " npm_username
  cat npmrc | sed 's/${name}/'"$name"'/' | sed 's/${email}/'"$email"'/' | sed 's/${gh_username}/'"$gh_username"'/' | sed 's/${npm_username}/'"$npm_username"'/' > "$HOME/.npmrc"
}

backup_npmrc () {
  if [ ! -d "$HOME/$backup_dir" ]; then
    mkdir -p "$HOME/$backup_dir"
  fi
  cp "$HOME/.npmrc" "$HOME/$backup_dir/.npmrc";
}

echo "Creating .npmrc"
if [ -e "$HOME/.npmrc" ]; then
  read -p "overwirte .npmrc? [y=Yes; n=No; b=Backup then Overwrite]" yn
  case $yn in
      [Yy]* ) rm -rf "$HOME/.npmrc";generate_npmrc;;
      [Bb]* ) backup_npmrc; rm -rf "$HOME/.npmrc";generate_npmrc;;
      [Nn]* ) echo ".npmrc ignored";;
          * ) echo ".npmrc ignored";;
  esac
else
  generate_npmrc
fi


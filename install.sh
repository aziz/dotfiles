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
  if [[ ${name: -3} != ".sh" && ${name: -3} != ".md" && $name != 'gitconfig' ]]; then
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

sudo defaults write /Library/Preferences/org.openbsd.openssh KeychainIntegration -bool NO
echo "Config: Disabled KeychainIntegration for SSH"

sudo defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
echo "Config: Save to disk (not to iCloud) by default"

sudo defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
echo "Config: Automatically quit printer app once the print jobs complete"

# Faster Terminal init
sudo rm -rf /private/var/log/asl/*.asl

#!/usr/bin/env bash

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
user_info_dir="$PWD/user.info"
user_info="$user_info_dir/user.info.yml"

for name in *; do

  target="$HOME/.$name"

  # ignore *.md and *.sh files
  if [[ ${name: -3} != ".sh" && ${name: -3} != ".md"  && $name != 'gitconfig' && $name != 'npmrc' ]]; then
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
        cp "$target" "$HOME/$backup_dir/.$name$(date +"%d-%m-%Y-%H:%M:%S")"
      fi
      rm -rf "$target"
    fi

    echo "Creating $target"
    ln -s "$PWD/$name" "$target"
  fi

done

get_user_info () {
  read -p "Your Git Name: " name
  read -p "Your Git Email: " email
  read -p "Your Github Username: " github_username
  read -p "Your NPM Name: " npm_name
  read -p "Your NPM Email: " npm_email
  read -p "Your NPM Username: " npm_username
  cat >"$user_info" <<EOL
name: ${name}
email: ${email}
github_username: ${github_username}
npm_name: ${npm_name}
npm_email: ${npm_email}
npm_username: ${npm_username}
EOL
  echo "Stored your user info in $user_info"
}

generate_gitconfig () {
  name=$(grep -E '^name:' < "$user_info")
  name="${name/name: /''}"
  email=$(grep -E '^email:' < "$user_info")
  email="${email/email: /''}"
  github_username=$(grep -E '^github_username:' < "$user_info")
  github_username="${github_username/github_username: /''}"
  cat gitconfig | \
    sed 's/${name}/'"$name"'/' | \
    sed 's/${email}/'"$email"'/' | \
    sed 's/${github_username}/'"$github_username"'/' > \
    "$HOME/.gitconfig"
}

generate_npmrc () {
  name=$(grep -E '^npm_name:' < "$user_info")
  name="${name/npm_name: /''}"
  email=$(grep -E '^npm_email:' < "$user_info")
  email="${email/npm_email: /''}"
  github_username=$(grep -E '^github_username:' < "$user_info")
  github_username="${github_username/github_username: /''}"
  npm_username=$(grep -E '^npm_username:' < "$user_info")
  npm_username="${npm_username/npm_username: /''}"
  cat npmrc | \
    sed 's/${name}/'"$name"'/' | \
    sed 's/${email}/'"$email"'/' | \
    sed 's/${github_username}/'"$github_username"'/' | \
    sed 's/${npm_username}/'"$npm_username"'/' > \
    "$HOME/.npmrc"
}

backup_file () {
  if [ ! -d "$HOME/$backup_dir" ]; then
    mkdir -p "$HOME/$backup_dir"
  fi
  timestamp=$(date +"%Y-%m-%d-%H-%M-%S")
  echo "Backing up old .$1 at '$HOME/$backup_dir/.$1-$timestamp'"
  cp "$HOME/.$1" "$HOME/$backup_dir/.$1-$timestamp"
}

if [ ! -f "$user_info" ]; then get_user_info; fi

echo "Creating .gitconfig"
if [ -f "$HOME/.gitconfig" ]; then backup_file gitconfig; fi
rm -rf "$HOME/.gitconfig"
generate_gitconfig

echo "Creating .npmrc"
if [ -f "$HOME/.npmrc" ]; then backup_file npmrc; fi
rm -rf "$HOME/.npmrc"
generate_npmrc




#!/usr/bin/env bash

gdv () {
  git diff -w "$@" | vim -R -
}

gds () {
  git diff -w "$@" | subl -n --command 'toggle_tabs' -
}

# Usage: new-github topfunky tidy_table
new_github () {
  git remote add origin git@github.com:$1/$2.git
  git push -u origin master
}

git_track_upstream () {
  local CURRENT_BRANCH
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git branch --set-upstream-to="$(git remote | head)"/"$CURRENT_BRANCH" "$CURRENT_BRANCH"
}

git_remove_missing_files () {
  git ls-files -d -z | xargs -0 git update-index --remove
}

# Adds files to git's exclude file (same as .gitignore)
local-ignore () {
  echo "$1" >> .git/info/exclude
}

# get a quick overview for your git repo
git_info () {
    if [ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]; then
        # print informations
        echo "git repo overview"
        echo "-----------------"
        echo

        # print all remotes and thier details
        for remote in $(git remote show); do
            echo "$remote":
            git remote show "$remote"
            echo
        done

        # print status of working repo
        echo "status:"
        if [ -n "$(git status -s 2> /dev/null)" ]; then
            git status -s
        else
            echo "working directory is clean"
        fi

        # print at least 5 last log entries
        echo
        echo "log:"
        git log -5 --oneline
        echo

    else
        echo "you're currently not in a git repository"
    fi
}

git_stats () {
  # awesome work from https://github.com/esc/git-stats
  # including some modifications

  if [ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]; then
      echo "Number of commits per author:"
      git --no-pager shortlog -sn --all
      AUTHORS=$( git shortlog -sn --all | cut -f2 | cut -f1 -d' ')
      LOGOPTS=""
      if [ "$1" == '-w' ]; then
          LOGOPTS="$LOGOPTS -w"
          shift
      fi
      if [ "$1" == '-M' ]; then
          LOGOPTS="$LOGOPTS -M"
          shift
      fi
      if [ "$1" == '-C' ]; then
          LOGOPTS="$LOGOPTS -C --find-copies-harder"
          shift
      fi
      for a in $AUTHORS
      do
          echo '-------------------'
          echo "Statistics for: $a"
          echo -n "Number of files changed: "
          git log $LOGOPTS --all --numstat --format="%n" --author=$a | cut -f3 | sort -iu | wc -l
          echo -n "Number of lines added: "
          git log $LOGOPTS --all --numstat --format="%n" --author=$a | cut -f1 | awk '{s+=$1} END {print s}'
          echo -n "Number of lines deleted: "
          git log $LOGOPTS --all --numstat --format="%n" --author=$a | cut -f2 | awk '{s+=$1} END {print s}'
          echo -n "Number of merges: "
          git log $LOGOPTS --all --merges --author=$a | grep -c '^commit'
      done
  else
      echo "you're currently not in a git repository"
  fi
}

# Stage deleted files for git
gitrm () {
  for x in $(git status -s | grep " D" | awk '{print $2}'); do git rm "$x"; done
}

git_ignore_in_empty_folders () {
  find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;
}

git_remove_history () {
  # Author: David Underhill
  # Script to permanently delete files/folders from your git repository.  To use
  # it, cd to your repository's root and then run the script with a list of paths
  # you want to delete, e.g., git-delete-history path1 path2

  if [ $# -eq 0 ]; then
      exit 0
  fi

  # make sure we're at the root of git repo
  if [ ! -d .git ]; then
      echo "Error: must run this script from the root of a git repository"
      exit 1
  fi

  # remove all paths passed as arguments from the history of the repo
  files="$@"
  git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch $files" HEAD

  # remove the temporary history git-filter-branch otherwise leaves behind for a long time
  rm -rf .git/refs/original/ && git reflog expire --all &&  git gc --aggressive --prune
}

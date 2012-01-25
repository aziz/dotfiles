# -*- Mode: shell-script -*-

_heroku_complete() {
  COMPREPLY=( $( compgen -W "$1" -- "$cur" ))
}

_heroku_commands() {
  # The echo is needed to squash the readline support in the Ruby interpreter that kills bash completion results
  # And... since this is slow, we're going to cache the result for a day.
  if [[ ! -f ~/.heroku/commands || `cd ~/.heroku && find "commands" -mmin +1440` ]]; then
    echo "" | heroku help | grep '#' | awk 'NF > 1 { print $1; }' > ~/.heroku/commands
  fi
  cat ~/.heroku/commands
}

# TODO: needs to take the naked command into account in some cases
_heroku_sub_commands() {
  echo "" | heroku help `echo $cur | cut -d":" -f1` | grep '#' | awk 'NF > 1 { print $1; }'
}

_heroku_sub_commands_regex() {
  echo "$(_heroku_commands)" | egrep -v "help|version" | tr "\n" "|"
}

_heroku_remotes() {
  git remote -v | sed -n 's/\([a-z]*\).*heroku\.com.*(push)/\1/p'
}

# heroku completion
_heroku() {
  local cur prev split=false
  COMPREPLY=()
  _get_comp_words_by_ref cur prev
  _split_longopt && split=true

  case $prev in
    help|version)
      return 0
      ;;
    --remote)
      _heroku_complete "$(_heroku_remotes)"
      return 0
      ;;
  esac

  $split && return 0

  if [[ $cur =~ ^(-|--) ]]; then
    _heroku_complete "--app --remote"
  elif [[ $cur =~ ^($(_heroku_sub_commands_regex)fargle) ]]; then
    _heroku_complete "$(_heroku_sub_commands)"
  else
    _heroku_complete "$(_heroku_commands)"
  fi
  __ltrim_colon_completions "$cur"
  return 0
}
complete -o nospace -F _heroku heroku

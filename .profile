function parse_git_dirty {  
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*" 
}

function parse_git_branch {  
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/" 
}

# alternative to "rails" command to use templates
function lego {
  appname=$1
  rails $appname -m http://github.com/aziz/rails-lego/raw/master/lego.rb $@
}

#   showing current git branch and status
export PS1='\[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/git/bin:/usr/local/mongodb/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export EDITOR="mate -w"
export RDOCOPT="--inline-source --format=html --template=hanna"

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion 
fi

# my rake
alias rake='rake --rakelibdir ~/.rake/'

# misc
alias reload='. ~/.profile'
alias cls="clear"
alias e="mate"

#rails
alias ss="script/server"
alias sc="script/console"
alias sg="script/generate"

#git
alias gitx="open -a GitX ."
alias gg="git status"
alias gc="git commit"

#personal
alias wip="cd ~/wip/"


# export PS1="\w$ "
#   showing current git branch in a light green color
# export PS1="\w \[\033[01;32m\]\`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\\\\\*\ \(.+\)$/\(\\\\\\\\\1\)\ /\`\[\033[37m\]$\[\033[00m\] "
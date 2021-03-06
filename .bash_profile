export PATH="$HOME/bin:$PATH"
export STARDOG_HOME=/usr/local/src/stardog_data

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"


if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `dircolors ~/.dir_colors`
fi

# Useful aliases

alias ll='ls $LS_OPTIONS -lhF'
alias l='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias ssh="ssh -X"

# Shared History between shells
#export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
#export HISTSIZE=100000                   # big big history
#export HISTFILESIZE=100000               # big big history
#shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


export WORKON_HOME=~/.virtualenvs
source ~/.profile
source /usr/local/bin/virtualenvwrapper.sh

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

#export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true

export PIP_VIRTUALENV_BASE=$WORKON_HOME

export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad

export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/usr/local/lib/node

export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules

function PWD {
pwd | awk -F\/ '{if (NF>4) print "...", $(NF-2), $(NF-1), $(NF); else if (NF>3) print $(NF-2),$(NF-1),$(NF); else if (NF>2) print $(NF-1),$(NF); else if (NF>1) print $(NF);}' | sed -e 's# #\/#g'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
LIGHTBLUE="\[\033[1;34m\]"
LIGHTYELLOW="\[\033[1;33m\]"
LIGHTCYAN="\[\033[1;36m\]"

txtrst='\[\e[0m\]'    # Text Reset

source ~/git-completion.bash

# Git support functions for Evil Tomato
# Mohit Cheppudira <mohit@muthanna.com>

# Returns "*" if the current git branch is dirty.
function evil_git_dirty {
  [[ $(git diff --shortstat 2>/dev/null | tail -n1) != "" ]] && echo "*"
}

function git_untracked {
  local untracked=`git status --porcelain 2>/dev/null | grep ^?? | wc -l | sed 's# ##g'`
  if [ "$untracked" != "0" ]
  then
      echo "|untracked:$untracked"
  fi
}

# Get the current git branch name (if available)
evil_git_prompt() {
  # local ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)
  local ref=$(git branch 2>/dev/null | grep '^\*' | cut -b 3- | sed 's/[\(\)]//g')

  if [ "$ref" != "" ]
  then
    echo " ($ref$(evil_git_dirty)$(git_untracked)) "
  fi
}

venv_prompt() {
  local ref=$(echo $VIRTUAL_ENV | sed s#$WORKON_HOME/##g)

  if [ "$ref" != "" ]
  then
    echo "($ref)"
  fi
}

#export PS1="$(venv_prompt)$txtrst$RED[\$(date +%H:%M)]$txtrst [/\$(PWD)] $LIGHTCYAN\$(evil_git_prompt)$txtrst \$ "
#export PS2="> "

alias uuid="python -c 'from uuid import uuid4; import sys; sys.stdout.write(str(uuid4()))' | pbcopy"
alias ll="ls -ltrGah"

#export PYTHONPATH="/usr/local/lib/python2.6/site-packages/:$PYTHONPATH"

export PATH=$PATH:~/dev/android-sdk-mac_x86/platform-tools
export PATH=$PATH:~/dev/android-sdk-mac_x86/tools

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

ulimit -n 2048

[[ -s "/home/bmentges/.rvm/scripts/rvm" ]] && source "/home/bmentges/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
source /usr/local/bin/virtualenvwrapper.sh

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

alias ll="ls -ltrGah"
alias gs="git status"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

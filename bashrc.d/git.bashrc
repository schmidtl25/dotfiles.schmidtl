#!/bin/bash
###############################################################################
# File:         git.bashrc
# Author:       Jared Bold
# Date:         04.02.2018
# Description:
#   git bashrc file to be loaded by main bashrc
###############################################################################
#. ~/.git-completion.bash
# . ~/.git-prompt.sh
#. ~/.hub.bash_completion.sh
# export GIT_PS1_SHOWDIRTYSTATE=1
# export GIT_PS1_SHOWUNTRACKEDFILES=1
#export PS1='\u:\W$(__git_ps1 " (%s)")\$ '
#    PS1='[$USER@$MACHINENAME] $PWD $(git_prompt)
# export PS1="[\u@\h] \w $(__git_ps1 %s )\$\n "

#alias git_enable_tracking='export GIT_PS1_SHOWDIRTYSTATE=1 && export GIT_PS1_SHOWUNTRACKEDFILES=1;'
#alias git_disable_tracking='export GIT_PS1_SHOWDIRTYSTATE=0 && export GIT_PS1_SHOWUNTRACKEDFILES=0;'

alias ghub='env -u GITHUB_HOST hub'

ggb() {
  git grep -n "$1" | while IFS=: read i j k; do git blame -f -L $j,$j $i; done
}

ggib() {
  git grep -in "$1" | while IFS=: read i j k; do git blame -f -L $j,$j $i; done
}

# import ksh/profile git_prompt and integrate into PS1
#    PS1='[$USER@$MACHINENAME] $PWD $(git_prompt)
# '

rmgitlock() {
  find $(git rev-parse --show-toplevel) -name "index.lock" -delete
}

if [[ $(uname) =~ AIX ]]; then
    export PS1='[$USER@$HOSTNAME] \w \$\n '
else
    . ~/.git_prompt_cache.sh
    export PS1='[$USER@$HOSTNAME] \w $(git_prompt)\$\n '
fi

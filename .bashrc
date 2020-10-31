export LC_ALL=en_US


HISTCONTROL=ignoreboth
HISIGNORE='rm *:exit'
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend


export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -GF'
alias ll="ls -alt"
alias la="ls -l"


alias git='LANG=en_GB git'
alias tmux='tmux -u'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\n\[\033[1;32m\]\u\[\033[0;33m\]\$(parse_git_branch):\[\033[1;36m\]\w\n  \[\033[1;35m\]-> \[\e[00m\]"
export EDITOR='vim'

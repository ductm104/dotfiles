export MY_CACHE="$HOME/.local/state"
export LESSHISTFILE="$MY_CACHE/.lesshst"
export HISTFILE="$MY_CACHE/.bash_history"
export PYTHON_HISTORY="$MY_CACHE/.python_history"
export ZSH_COMPDUMP="$MY_CACHE/.zcompdump"
export MPLCONFIGDIR="$MY_CACHE/.matplotlib"

export HOMEBREW_NO_AUTO_UPDATE=1

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR='vi'

alias ls='ls -hGF --color=auto'
alias l="ls -lh"
alias la="ls -lha"
alias ll="ls -alht"

alias tmux='tmux -u -2'
alias tls='tmux ls'
alias ta='tmux a -t'

alias gls='git status'
alias gdiff='git diff'
alias gadd='git add'
alias gcommit='git commit'
alias gcomit='git commit'
alias gpull='git pull'
alias gpul='git pull'
alias gpush='git push'
alias glog='git log'

alias asitop='TERM=xterm-256color sudo asitop'
alias path='realpath'
alias uva='source .venv/bin/activate'

HISTCONTROL=ignoreboth
HISIGNORE='rm *:exit'
HISTSIZE=10000
HISTFILESIZE=400000000
shopt -s histappend

# avoid ctrl-D to quit the shell
# you need to press 5 times to actually quit
export IGNOREEOF=5

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PROMPT_DIRTRIM=3
export PS1="\n\[\033[1;32m\]\u@\h\[\033[0;33m\]\$(parse_git_branch):\[\033[1;36m\]\w\n  \[\033[1;35m\]-> \[\e[00m\]"

#alias git='LANG=en_GB git'
#export LC_ALL=en_US
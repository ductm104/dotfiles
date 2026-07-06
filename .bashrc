HISTCONTROL=ignoreboth
HISIGNORE='rm *:exit'
HISTSIZE=10000
HISTFILESIZE=400000000
shopt -s histappend

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -hGF'
alias l="ls -lh"
alias la="ls -lha"
alias ll="ls -alht"

# avoid ctrl-D to quit the shell
# you need to press 5 times to actually quit
export IGNOREEOF=5

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PROMPT_DIRTRIM=3
export PS1="\n\[\033[1;32m\]\u@\h\[\033[0;33m\]\$(parse_git_branch):\[\033[1;36m\]\w\n  \[\033[1;35m\]-> \[\e[00m\]"
#export VIMINIT='let $MYVIMRC="~/.config/dotfiles/.vimrc" | source $MYVIMRC'
#export MYVIMRC="~/.config/dotfiles/.vimrc"

alias tmux='tmux -u -f ~/.tmux.conf'
alias tmux='tmux -u -2'
alias tls='tmux ls'
alias ta='tmux a -t'

#alias git='LANG=en_GB git'
#export LC_ALL=en_US
export EDITOR='vi'

alias gls='git status'
alias gdiff='git diff'
alias gadd='git add'
alias gcommit='git commit'
alias gcomit='git commit'
alias gpull='git pull'
alias gpush='git push'

alias uva='source .venv/bin/activate'

HISTCONTROL=ignoreboth
HISIGNORE='rm *:exit'
HISTSIZE=10000
HISTFILESIZE=400000000
shopt -s histappend

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -GF --color=auto'
alias la="ls -l"
alias ll="ls -alt"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\n\[\033[1;32m\]\u@\h\[\033[0;33m\]\$(parse_git_branch):\[\033[1;36m\]\w\n  \[\033[1;35m\]-> \[\e[00m\]"
export VIMINIT='let $MYVIMRC="~/.config/dotfiles/.vimrc" | source $MYVIMRC'
export EDITOR='vim'
alias tmux='tmux -u -f ~/.config/dotfiles/.tmux.conf'

#alias git='LANG=en_GB git'
#export LC_ALL=en_US

export MY_CACHE="$HOME/.local/state"
export LESSHISTFILE="$MY_CACHE/.lesshst"
export HISTFILE="$MY_CACHE/.bash_history"
export PYTHON_HISTORY="$MY_CACHE/.python_history"
export ZSH_COMPDUMP="$MY_CACHE/.zcompdump"
export MPLCONFIGDIR="$MY_CACHE/.matplotlib"

export HOMEBREW_NO_AUTO_UPDATE=1

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

eval $(/opt/homebrew/bin/brew shellenv)

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)'
zstyle ':vcs_info:*' enable git
setopt PROMPT_SUBST
PROMPT="%B%F{green}%n\$vcs_info_msg_0_%f:%F{yellow}%3~  %F{cyan}->  %b%f"

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
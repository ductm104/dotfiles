eval $(/opt/homebrew/bin/brew shellenv)

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -GF'
alias ll="ls -alt"
alias la="ls -l"
alias tmux='tmux -u -2'

autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)'
zstyle ':vcs_info:*' enable git
setopt PROMPT_SUBST
PROMPT="%B%F{green}%n\$vcs_info_msg_0_%f:%F{yellow}%3~
  %F{cyan}->  %b%f"

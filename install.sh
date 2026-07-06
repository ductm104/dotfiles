#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info() {
  printf '%s\n' "$*"
}

backup_path() {
  local path="$1"
  local name
  local backup_path

  name="$(basename "$path")"
  backup_path="${DOTFILES_DIR}/${name}.backup.$(date +%Y%m%d-%H%M%S)"

  mv "$path" "$backup_path"
  info "Backed up $path to $backup_path"
}

link_file() {
  local source="$1"
  local target="$2"

  if [ ! -e "$source" ]; then
    info "Skipping missing source: $source"
    return
  fi

  if [ -L "$target" ]; then
    local current
    current="$(readlink "$target")"

    if [ "$current" = "$source" ]; then
      info "Already linked: $target -> $source"
      return
    fi

    backup_path "$target"
  elif [ -e "$target" ]; then
    backup_path "$target"
  fi

  ln -s "$source" "$target"
  info "Linked $target -> $source"
}

ensure_bashrc_source() {
  local bashrc="${HOME}/.bashrc"
  local managed_start="# >>> dotfiles bashrc >>>"
  local managed_end="# <<< dotfiles bashrc <<<"
  local source_line="[ -r \"${DOTFILES_DIR}/.bashrc\" ] && source \"${DOTFILES_DIR}/.bashrc\""

  touch "$bashrc"

  if grep -Fq "$managed_start" "$bashrc"; then
    info "Bash source block already exists in $bashrc"
    return
  fi

  {
    printf '\n%s\n' "$managed_start"
    printf '%s\n' "$source_line"
    printf '%s\n' "$managed_end"
  } >> "$bashrc"

  info "Added bash source block to $bashrc"
}

main() {
  info "Installing dotfiles from $DOTFILES_DIR"

  ensure_bashrc_source
  link_file "${DOTFILES_DIR}/.tmux.conf" "${HOME}/.tmux.conf"
  link_file "${DOTFILES_DIR}/.vimrc" "${HOME}/.vimrc"
  link_file "${DOTFILES_DIR}/.screenrc" "${HOME}/.screenrc"

  info "Done. Open a new shell or run: source ~/.bashrc"

  info "Backups are saved in: $DOTFILES_DIR"
}

main "$@"

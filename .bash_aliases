#!/usr/bin/env bash
# Sourced from ~/.bash_aliases (usually a symlink into this repo).
# Resolves the real repo path so extra alias files can live beside this one.

_dotfiles_root() {
  local src="${BASH_SOURCE[0]}"
  while [ -h "$src" ]; do
    local dir
    dir="$(cd -P "$(dirname "$src")" && pwd)"
    src="$(readlink "$src")"
    case "$src" in
      /*) ;;
      *) src="$dir/$src" ;;
    esac
  done
  cd -P "$(dirname "$src")" && pwd
}

DOTFILES_DIR="$(_dotfiles_root)"
unset -f _dotfiles_root

if [ -d "$DOTFILES_DIR/bash/aliases" ]; then
  for _alias_file in "$DOTFILES_DIR/bash/aliases/"*.sh; do
    [ -r "$_alias_file" ] && . "$_alias_file"
  done
  unset _alias_file
fi

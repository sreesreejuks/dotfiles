#!/usr/bin/env bash
# Link repo copies of shell files into $HOME. The Git repo is the backup;
# home files are symlinks so every machine stays in sync after git pull.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$DOTFILES_DIR/.bash_aliases"
DEST="${HOME}/.bash_aliases"

if [ ! -f "$SRC" ]; then
  echo "Missing $SRC" >&2
  exit 1
fi

install_dependencies() {
  local package_manager=""
  local privilege=""
  local missing=()
  local command_name

  for command_name in fzf rsync xsel nano; do
    if ! command -v "$command_name" >/dev/null 2>&1; then
      missing+=("$command_name")
    fi
  done

  if [ "${#missing[@]}" -eq 0 ]; then
    echo "Optional command dependencies already installed"
  else
    if command -v apt-get >/dev/null 2>&1; then
      package_manager="apt-get"
    elif command -v dnf >/dev/null 2>&1; then
      package_manager="dnf"
    elif command -v yum >/dev/null 2>&1; then
      package_manager="yum"
    fi

    if [ "$(id -u)" -eq 0 ]; then
      privilege=""
    elif command -v sudo >/dev/null 2>&1; then
      privilege="sudo"
    else
      echo "Missing optional commands: ${missing[*]}" >&2
      echo "Install them as root or install sudo, then rerun install.sh." >&2
      return 1
    fi

    if [ -z "$package_manager" ]; then
      echo "Missing optional commands: ${missing[*]}"
      echo "Install them with your distribution's package manager."
    elif [ "$package_manager" = "apt-get" ]; then
      echo "Installing missing commands: ${missing[*]}"
      if [ -n "$privilege" ]; then
        "$privilege" apt-get install -y "${missing[@]}"
      else
        apt-get install -y "${missing[@]}"
      fi
    else
      echo "Installing missing commands: ${missing[*]}"
      if [ -n "$privilege" ]; then
        "$privilege" "$package_manager" install -y "${missing[@]}"
      else
        "$package_manager" install -y "${missing[@]}"
      fi
    fi
  fi

  if ! command -v kubectl >/dev/null 2>&1; then
    echo "kubectl is not installed; Kubernetes aliases will be unavailable"
  fi
}

link_file() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ]; then
    local current
    current="$(readlink "$dest")"
    if [ "$current" = "$src" ]; then
      echo "Already linked: $dest -> $src"
      return 0
    fi
    echo "Replacing symlink $dest ($current)"
    rm "$dest"
  elif [ -e "$dest" ]; then
    local backup="${dest}.bak.$(date +%Y%m%d%H%M%S)"
    echo "Backing up existing $dest -> $backup"
    mv "$dest" "$backup"
  fi

  ln -s "$src" "$dest"
  echo "Linked $dest -> $src"
}

ensure_bashrc_sources_aliases() {
  local bashrc="${HOME}/.bashrc"
  local marker="# dotfiles: bash aliases"
  local snippet
  snippet=$(cat <<'EOF'

# dotfiles: bash aliases
if [ -f "$HOME/.bash_aliases" ]; then
  . "$HOME/.bash_aliases"
fi
EOF
)

  if [ ! -f "$bashrc" ]; then
    echo "Creating $bashrc"
    printf '%s\n' "$snippet" | sed '1d' >"$bashrc"
    echo "Wrote alias source block to $bashrc"
    return 0
  fi

  if grep -Fq "$marker" "$bashrc" 2>/dev/null || grep -Eq '(\.|source)[[:space:]]+(\$HOME|~)/\.bash_aliases' "$bashrc" 2>/dev/null; then
    echo ".bashrc already sources aliases"
    return 0
  fi

  printf '%s\n' "$snippet" >>"$bashrc"
  echo "Appended alias source block to $bashrc"
}

install_dependencies
link_file "$SRC" "$DEST"
ensure_bashrc_sources_aliases

echo
echo "Done. Open a new shell, or run:  source ~/.bash_aliases"
echo "Try:  alias k"

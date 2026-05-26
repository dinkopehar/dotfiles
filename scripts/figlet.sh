#!/usr/bin/env bash
set -euo pipefail

is_fedora_linux() {
  [[ "$(uname -s)" == "Linux" ]] || return 1

  if [[ ! -f /etc/os-release ]]; then
    return 1
  fi

  # shellcheck disable=SC1091
  source /etc/os-release

  [[ "${ID:-}" == "fedora" ]]
}

if ! is_fedora_linux; then
  echo "Not Fedora Linux. Skipping package installation."
  exit 0
fi

FONT_DIR="$HOME/.local/share/figlet"
REPO_DIR="$FONT_DIR/xero-figlet-fonts"
REPO_URL="https://github.com/xero/figlet-fonts.git"

mkdir -p "$FONT_DIR"

if ! command -v figlet >/dev/null 2>&1; then
    sudo dnf install -y figlet
fi

if [[ -d "$REPO_DIR/.git" ]]; then
  echo "Updating figlet fonts..."
  git -C "$REPO_DIR" pull --ff-only
else
  echo "Installing figlet fonts..."
  git clone --depth 1 "$REPO_URL" "$REPO_DIR"
fi

echo "Figlet fonts installed to:"
echo "  $REPO_DIR"
echo
echo "Example:"
echo "  figlet -d \"$REPO_DIR\" -f \"ANSI Shadow\" \"Dinko\""

#!/usr/bin/env bash
set -euo pipefail

if command -v mise >/dev/null 2>&1; then
  echo "Mise is already installed: $(command -v mise)"
  exit 0
fi

echo "Installing Mise..."

curl -fsSL https://mise.run | sh

if [[ -x "$HOME/.local/bin/mise" ]]; then
  echo "Mise installed successfully at $HOME/.local/bin/mise"
elif command -v mise >/dev/null 2>&1; then
  echo "Mise installed successfully at $(command -v mise)"
else
  echo "Mise installation finished, but 'mise' was not found in PATH."
  echo "Add this to your shell config if missing:"
  echo '  export PATH="$HOME/.local/bin:$PATH"'
fi

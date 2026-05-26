#!/usr/bin/env bash
set -euo pipefail

if command -v zed >/dev/null 2>&1; then
  echo "Zed is already installed: $(command -v zed)"
  exit 0
fi

echo "Installing Zed editor..."

curl -fsSL https://zed.dev/install.sh | sh

if [[ -x "$HOME/.local/bin/zed" ]]; then
  echo "Zed installed successfully at $HOME/.local/bin/zed"
elif command -v zed >/dev/null 2>&1; then
  echo "Zed installed successfully at $(command -v zed)"
else
  echo "Zed installation finished, but 'zed' was not found in PATH."
  echo "Add this to your shell config if missing:"
  echo '  export PATH="$HOME/.local/bin:$PATH"'
fi

#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# mise runs the rest of the bootstrap, so it has to exist first, and its global
# config has to be linked before `mise bootstrap` can read the declarations.
if ! command -v mise >/dev/null 2>&1; then
  echo "Installing Mise..."
  curl -fsSL https://mise.run | sh
fi

export PATH="$HOME/.local/bin:$PATH"

link="$HOME/.config/mise/config.toml"
target="$root_dir/.config/mise/config.toml"

mkdir -p "$(dirname "$link")"

if [[ -e "$link" && ! -L "$link" ]]; then
  echo "Exists and is not a symlink. Not overwriting: $link"
  exit 1
fi

ln -sfn "$target" "$link"
echo "Linked: $link -> $target"

exec mise bootstrap "$@"

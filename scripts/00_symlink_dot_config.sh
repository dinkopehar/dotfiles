#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

links=(
  ".config/starship.toml"
  ".config/zed/settings.json"
  ".config/zed/keymap.json"
  ".config/waveterm/settings.json"
  ".config/mise/config.toml"
  ".config/git/config"
  ".config/git/ignore"
  ".config/background"
  ".bashrc"
  ".env.sh"
)

for path in "${links[@]}"; do
  target="$root_dir/$path"
  link="$HOME/$path"

  mkdir -p "$(dirname "$link")"

  if [[ -e "$link" && ! -L "$link" ]]; then
    echo "Exists and is not a symlink. Not overwriting: $link"
    exit 1
  fi

  ln -sfn "$target" "$link"
  echo "Linked: $link -> $target"
done

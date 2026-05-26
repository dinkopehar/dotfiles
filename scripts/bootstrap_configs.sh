#!/usr/bin/env bash
set -euo pipefail

source_file="$PWD/.config/starship.toml"
target_dir="$HOME/.config"
target_file="$target_dir/starship.toml"

if [[ ! -f "$source_file" ]]; then
  echo "Missing source file: $source_file"
  exit 1
fi

mkdir -p "$target_dir"

if [[ -L "$target_file" ]]; then
  current_target="$(readlink "$target_file")"

  if [[ "$current_target" == "$source_file" ]]; then
    echo "Symlink already correct: $target_file -> $source_file"
    exit 0
  fi

  ln -sfn "$source_file" "$target_file"
  echo "Updated symlink: $target_file -> $source_file"
  exit 0
fi

if [[ -e "$target_file" ]]; then
  echo "Target exists and is not a symlink. Not overwriting: $target_file"
  exit 1
fi

ln -s "$source_file" "$target_file"
echo "Created symlink: $target_file -> $source_file"

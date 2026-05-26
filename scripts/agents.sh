#!/usr/bin/env bash
set -euo pipefail

skills add obra/superpowers --global --yes -a codex -a claude-code --skill 'systematic-debugging'
skills add obra/superpowers --global --yes -a codex -a claude-code --skill 'brainstorming'

source_rules=".codex/rules"
target_rules="$HOME/.codex/rules"

mkdir -p "$HOME/.codex"

if [[ -d "$target_rules" ]]; then
  echo "Rules folder already exists. Skipping copy: $target_rules"
fi

if [[ -e "$target_rules" ]]; then
  echo "Target exists but is not a directory. Skipping: $target_rules"
fi

if [[ ! -d "$source_rules" ]]; then
  echo "Source rules folder missing: $source_rules"
fi

cp -r "$source_rules" "$target_rules"

echo "Copied rules to: $target_rules"

source_file=".codex/.config.toml"
target_file="$HOME/.codex/.config.toml"

if [[ ! -e "$target_file" ]]; then
  cp "$source_file" "$target_file"
  echo "Copied: $target_file"
  exit 0
fi

if [[ ! -f "$target_file" ]]; then
  echo "Target exists but is not a regular file. Skipping: $target_file"
  exit 1
fi

if cmp -s "$source_file" "$target_file"; then
  echo "Already up to date: $target_file"
else
  echo "Different content. Not overwriting: $target_file"
fi

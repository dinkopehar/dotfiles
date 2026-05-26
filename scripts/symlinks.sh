#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

source_agents="$root_dir/.agents/AGENTS.md"
codex_dir="$HOME/.codex"
claude_dir="$HOME/.claude"

codex_agents="$codex_dir/AGENTS.md"
claude_link="$claude_dir/CLAUDE.md"

if [[ ! -f "$source_agents" ]]; then
  echo "Missing source file: $source_agents"
  exit 1
fi

mkdir -p "$codex_dir" "$claude_dir"

# Copy AGENTS.md to ~/.codex/AGENTS.md
if [[ ! -e "$codex_agents" ]]; then
  cp "$source_agents" "$codex_agents"
  echo "Copied: $codex_agents"
elif [[ -f "$codex_agents" ]] && cmp -s "$source_agents" "$codex_agents"; then
  echo "Already up to date: $codex_agents"
elif [[ -f "$codex_agents" ]]; then
  cp "$source_agents" "$codex_agents"
  echo "Updated: $codex_agents"
else
  echo "Target exists but is not a regular file: $codex_agents"
  exit 1
fi

# Create ~/.claude/CLAUDE.md -> ../.codex/AGENTS.md
target_relative="../.codex/AGENTS.md"

if [[ -L "$claude_link" ]]; then
  current_target="$(readlink "$claude_link")"

  if [[ "$current_target" == "$target_relative" ]]; then
    echo "Symlink already correct: $claude_link -> $target_relative"
  else
    ln -sfn "$target_relative" "$claude_link"
    echo "Updated symlink: $claude_link -> $target_relative"
  fi
elif [[ -e "$claude_link" ]]; then
  echo "CLAUDE.md already exists and is not a symlink. Not overwriting: $claude_link"
  exit 1
else
  ln -s "$target_relative" "$claude_link"
  echo "Created symlink: $claude_link -> $target_relative"
fi

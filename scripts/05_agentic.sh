#!/usr/bin/env bash
set -euo pipefail

skills add obra/superpowers --global --yes \
  -a codex \
  -a claude-code \
  --skill systematic-debugging \
  --skill brainstorming

skills add mattpocock/skills --global --yes \
  -a codex \
  -a claude-code \
  --skill caveman

skills add ogulcancelik/herdr --global --yes \
  -a codex \
  -a claude-code \
  --skill herdr

root_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

link_file() {
  local link="$HOME/$1"
  local target="$root_dir/$2"

  mkdir -p "$(dirname "$link")"

  if [[ -e "$link" && ! -L "$link" ]]; then
    echo "Exists and is not a symlink. Not overwriting: $link"
    exit 1
  fi

  ln -sfn "$target" "$link"
  echo "Linked: $link -> $target"
}

links=(
  ".codex/.config.toml:.codex/.config.toml"
  ".codex/rules/pnpm.rules:.codex/rules/pnpm.rules"
  ".codex/rules/nondestructive-allowlist.rules:.codex/rules/nondestructive-allowlist.rules"

  ".agents/AGENTS.md:.agents/AGENTS.md"
  ".claude/AGENTS.md:.agents/AGENTS.md"
  ".codex/AGENTS.md:.agents/AGENTS.md"
)

for item in "${links[@]}"; do
  link_file "${item%%:*}" "${item#*:}"
done

#!/usr/bin/env bash
set -euo pipefail

directories=(
  "$HOME/Projects"
)

for dir in "${directories[@]}"; do
  mkdir -p "$dir"
done

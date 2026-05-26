#!/usr/bin/env bash
set -euo pipefail

script_dir="./scripts"

for script in "$script_dir"/*.sh; do
  [[ -f "$script" ]] || continue

  name="$(basename "$script")"

  echo
  echo "=== ${name} ==="

  bash "$script"
done

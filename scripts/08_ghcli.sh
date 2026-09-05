#!/usr/bin/env bash
set -euo pipefail

# The bootstrap task runs on every `mise bootstrap`, and installing an
# extension twice is an error.
if ! gh extension list | grep -q gh-pr-review; then
  gh extension install agynio/gh-pr-review
fi

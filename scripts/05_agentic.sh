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

skills add github/gh-stack --global --yes \
  -a codex \
  -a claude-code \

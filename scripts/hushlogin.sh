#!/usr/bin/env bash
set -euo pipefail

filename='.hushlogin'
filename_path="$HOME/$filename"

if [[ "$(uname -s)" != "Darwin" ]]; then
    if [[ -f $filename_path ]]; then
        echo "$filename exists, skiping"
    else
        cp $filename $filename_path
        echo "Copied $filename to $filename_path"
    fi
  exit 0
fi

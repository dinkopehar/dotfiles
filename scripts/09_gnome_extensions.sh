#!/usr/bin/env bash
set -euo pipefail

extensions=(
  appindicatorsupport@rgcjonas.gmail.com
  auto-theme-switcher@amritashan.github.io
  blur-my-shell@aunetx
  just-perfection-desktop@just-perfection
  tophat@fflewddur.github.io
)

if [[ "$(uname -s)" != "Linux" ]]; then
  echo "Not Linux. Skipping GNOME extension installation."
  exit 0
fi

required_commands=(curl gnome-extensions gnome-shell python3)

for command in "${required_commands[@]}"; do
  if ! command -v "$command" >/dev/null 2>&1; then
    echo "$command is not installed. Skipping GNOME extension installation."
    exit 0
  fi
done

gnome_shell_version="$(gnome-shell --version | awk '{print $3}')"
gnome_shell_version="${gnome_shell_version%%.*}"
temporary_directory="$(mktemp -d)"

cleanup() {
  rm -rf "$temporary_directory"
}

trap cleanup EXIT

for extension in "${extensions[@]}"; do
  extension_info="$(
    curl --fail --location --silent --show-error --get \
      --data-urlencode "uuid=$extension" \
      --data-urlencode "shell_version=$gnome_shell_version" \
      https://extensions.gnome.org/extension-info/
  )"
  download_path="$(
    python3 -c 'import json, sys; print(json.load(sys.stdin)["download_url"])' \
      <<< "$extension_info"
  )"
  archive="$temporary_directory/$extension.zip"

  echo "Installing $extension"
  curl --fail --location --silent --show-error \
    "https://extensions.gnome.org$download_path" \
    --output "$archive"
  gnome-extensions install --force "$archive"
done

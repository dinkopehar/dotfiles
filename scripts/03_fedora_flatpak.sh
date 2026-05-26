#!/usr/bin/env bash
set -euo pipefail

if ! command -v flatpak >/dev/null 2>&1; then
  echo "flatpak is not installed. Skipping Flatpak app installation."
  exit 0
fi

apps=(
  com.github.tenderowl.frog
  com.google.Chrome
  com.mattjakeman.ExtensionManager
  io.dbeaver.DBeaverCommunity
  org.biblemulti.thelife
  org.gitfourchette.gitfourchette
  io.podman_desktop.PodmanDesktop
  net.poedit.Poedit
  org.jamovi.jamovi
  org.localsend.localsend_app
  be.alexandervanhee.gradia
)

flatpak install -y flathub "${apps[@]}"

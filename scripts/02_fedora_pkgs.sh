#!/usr/bin/env bash
set -euo pipefail

is_fedora_linux() {
  [[ "$(uname -s)" == "Linux" ]] || return 1

  if [[ ! -f /etc/os-release ]]; then
    return 1
  fi

  # shellcheck disable=SC1091
  source /etc/os-release

  [[ "${ID:-}" == "fedora" ]]
}

if ! is_fedora_linux; then
  echo "Not Fedora Linux. Skipping package installation."
  exit 0
fi

packages=(
  perl-FindBin
  libuuid-devel
  readline-devel
  autoconf
  ncurses-devel
  gcc-c++
  jemalloc-devel
  fuse
  fuse-libs
  figlet
  geos
  geos-devel
  proj
  proj-devel
  gdal
  gdal-devel
  protobuf-c
  protobuf-c-devel
  json-c
  json-c-devel
  libxml2-devel
  llvm
  openssl-devel
  gcc-c++
  gtk4-devel
  libadwaita-devel
  blueprint-compiler
  dnf-plugins-core
  android-tools
  scrcpy
  flatpak-builder
  flatpak
  #vocalinux-gui
)

sudo dnf install --quiet --assumeyes \
  "${packages[@]}" \
  @development-tools

sudo dnf install --quiet --assumeyes \
  https://github.com/theBGuy/GitDesktop/releases/download/v0.9.6/GitDesktop-0.9.6-1.x86_64.rpm

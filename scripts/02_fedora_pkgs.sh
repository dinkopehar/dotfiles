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
)

sudo dnf install --quiet --assumeyes \
  "${packages[@]}" \
  @development-tools

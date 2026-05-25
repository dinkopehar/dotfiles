is_fedora() {
  local os_release="/etc/os-release"
  local os_id=""
  local os_like=""

  if [[ ! -r "$os_release" ]]; then
    return 1
  fi

  os_id="$(sed -n 's/^ID=//p' "$os_release" | head -n 1 | tr -d '"')"
  os_like="$(sed -n 's/^ID_LIKE=//p' "$os_release" | head -n 1 | tr -d '"')"

  [[ "$os_id" == "fedora" || " $os_like " == *" fedora "* ]]
}

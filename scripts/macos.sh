#!/usr/bin/env bash
set -euo pipefail

filename='.hushlogin'
filename_path="$HOME/$filename"

if [[ "$(uname -s)" != "Darwin" ]]; then
    exit 0
fi

if [[ "$(uname -s)" == "Darwin" ]]; then
    echo "Writings MacOS defaults..."

    defaults write com.apple.dock show-process-indicators -bool true
    defaults write com.apple.finder EmptyTrashSecurely -bool true
    defaults write com.apple.finder CreateDesktop -bool false

    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -float 0.2
fi

if [[ "$(uname -s)" == "Darwin" ]]; then
    brew tap homebrew/cask-fonts >/dev/null

    echo "Installing Brew packages..."

    brew bundle --no-lock --file=/dev/stdin <<'EOF'
    brew "bat"
    brew "bitwarden-cli"
    brew "cloc"
    brew "exa"
    brew "fish"
    brew "fisher"
    brew "fortune"
    brew "httpie"
    brew "jq"
    brew "neovim"
    brew "peco"
    brew "pfetch"
    brew "ripgrep"
    brew "starship"
    brew "tealdeer"
    brew "tree-sitter"

    cask "alt-tab"
    cask "docker"
    cask "figma"
    cask "font-iosevka-nerd-font"
    cask "font-jetbrains-mono-nerd-font"
    cask "jetbrains-toolbox"
    cask "keycastr"
    cask "rectangle"
    cask "smoothscroll"
    cask "visual-studio-code"
    EOF
fi

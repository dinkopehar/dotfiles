# dinko-pehar/dotfiles

My dotfiles, managed with [chezmoi](https://chezmoi.io/).

## Installation

> curl https://mise.run | sh

then use:

```bash
mise exec chezmoi bitwarden -- chezmoi init --apply dinko-pehar
```

for temporary tool execution to apply settings.

## Helper

Export `BW_SESSION` to unlock Bitwarden CLI:

```bash
export BW_SESSION=$(bw unlock --raw)
```

# dinko-pehar/dotfiles

My dotfiles, managed with [chezmoi](https://chezmoi.io/).

## Installation

Install:
- Chezmoi
- Bitwarden CLI
- Brew(_MacOS_)

then use:

```bash
export BW_SESSION=$(bw unlock --raw)
chezmoi init --apply dinko-pehar
```

to apply settings.

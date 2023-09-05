Install Chezmoi and Bitwarden, then use:

```
export BW_SESSION=$(bw unlock --raw)
chezmoi init --apply dinko-pehar
```

to apply settings.
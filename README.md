<div align="center">
  <img src=".github/assets/dotfiles-wallpaper.png" alt="Dotfiles Figlet Font" width="60%" />
  <p>
    This repository is the working surface behind my daily machine setup:
    a curated editor, reproducible tooling, opinionated defaults, and a bootstrap flow
    that keeps new environments fast to assemble.
  </p>
  <p>
    <a href="#stack">Stack</a> ·
    <a href="#workflow">Workflow</a> ·
    <a href="#managed-surface">Managed Surface</a> ·
    <a href="#bootstrap">Bootstrap</a>
  </p>
</div>

---

<div align="center">
  <img src=".github/assets/wallpaper.png" alt="Wallpaper Fedora" width="100%" />
</div>

## Stack

<table>
  <tr>
    <td valign="top" width="33%">
      <strong>Bash + Starship</strong><br />
      A simple shell baseline with a prompt that adds structure without adding noise.
    </td>
    <td valign="top" width="33%">
      <strong>Zed</strong><br />
      The primary editor, tuned for a cleaner UI, light theme bias, and built-in AI tooling.
    </td>
    <td valign="top" width="33%">
      <strong>Mise</strong>
      <img src=".github/assets/mise-logo.svg" alt="Mise logo" height="26" /><br />
      The runtime and tool manager that keeps core CLI dependencies reproducible across machines.
    </td>
  </tr>
  <tr>
    <td valign="top" width="33%">
      <strong>Bootstrap Scripts</strong><br />
      A small script chain for linking config, preparing tools, and bringing new machines up quickly.
    </td>
    <td valign="top" width="33%">
      <strong>Agent Tooling</strong><br />
      Codex and Claude Code setup, shared rules, and bootstrap automation for agent-assisted work.
    </td>
    <td valign="top" width="33%"></td>
  </tr>
</table>

## Workflow

This setup is optimized for a machine that should feel ready quickly and stay readable all day.

- Light, quiet editor defaults over dense or flashy UI.
- Reproducible tools managed through `mise` instead of one-off installs.
- Declarative machine bootstrap through `mise`: system packages, dotfile links, and repo checkouts.
- Agent-friendly local development with shared rules and editor integration already wired in.

## Managed Surface

This repository focuses on a small, intentional surface area rather than trying to own every part of the machine.

- `bootstrap.sh` installs `mise`, links its global config, and hands the flow to `mise bootstrap`.
- Selected config is symlinked into place for `Zed`, `mise`, and `starship` from `[dotfiles]`.
- Agent configuration is linked into `.agents`, `.claude`, and `.codex` with shared rules for local coding tools.
- `[bootstrap.packages]` covers dnf and Flatpak on Fedora and Homebrew on macOS; `[bootstrap.macos.defaults]` covers macOS preferences.

## Bootstrap

The fastest way to apply the setup is:

```bash
./bootstrap.sh
```

That entrypoint installs `mise` if missing, links [`.config/mise/config.toml`](.config/mise/config.toml) to `~/.config/mise/config.toml`, then runs `mise bootstrap`, which converges packages, repo checkouts, dotfile links, and tools before running the `bootstrap` task for the remaining scripts in [`scripts/`](scripts/). Tested on Fedora 44.

Flags pass straight through, so `./bootstrap.sh --dry-run` shows what a run would change and `mise bootstrap plan` reports declarative drift.

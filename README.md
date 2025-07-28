# Linux Dotfiles

This repository tracks my Linux scripts and config files, collectively referred to as *dotfiles*.

## Installation

The `.bin/bootstrap` script automates the entire dotfiles setup. It’s designed to run safely on both new and existing machines, ensuring your environment is always consistent and up to date.

On every run, it deletes any previous installation and clones the latest version of the repository as a [bare repository](https://www.atlassian.com/git/tutorials/dotfiles) with [sparse checkout](https://git-scm.com/docs/git-sparse-checkout). This guarantees a clean, reproducible setup without leftover or stale files.

To protect local changes, it detects conflicting non-image files, backs them up before checkout, and restores them afterward. This makes the script safe to run repeatedly — no changes are lost unless explicitly overwritten.

Additional options:
- `--headless` —  exclude GUI-related dotfiles (for servers or WSL)
- `--force` — force overwrite local files (destructive)
- `--help` — show more details

### New Machine

Run the bootstrap script directly from GitHub:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/tk755/dotfiles/main/.bin/bootstrap)
```

### Existing Machine

Use the `bootstrap` command to apply the latest dotfiles:

```bash
bootstrap           # skip conflicting files
bootstrap --force   # overwrite conflicting files
```

## Making Changes

To make changes to the repository, use the `dotfiles` alias as a `git` command:

```bash
dotfiles add $HOME/.bashrc
dotfiles commit -m 'update bashrc'
dotfiles push
```

## File Organization

(This is a WIP)

### Scripts

User-level scripts are stored in `~/.bin/`:
- `~/.bin/` — scripts shared across all machines
- `~/.bin/<hostname>/` — scripts specific to a particular machine

Both paths are added to `$PATH`, with the `~/.bin/<hostname>/` directory taking precedence. This allows machine-specific scripts to override shared ones of the same name.

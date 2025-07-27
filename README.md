# Linux Dotfiles

This repository tracks my Linux scripts and config files, managed as a [bare repository](https://www.atlassian.com/git/tutorials/dotfiles) using [sparse checkout](https://git-scm.com/docs/git-sparse-checkout).

## Installation

The `.bin/bootstrap` script automates the entire setup process. 

It can take the following options:
- `--headless` —  exclude GUI-related dotfiles (for servers or WSL)
- `--force` — force overwrite local files (destructive)
- `--help` — show more details

### New Machine

Set up a new machine by running the raw script directly from GitHub:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/tk755/dotfiles/main/.bin/bootstrap)
```

### Existing Machine

After initial setup, use the `bootstrap` command to install the latest dotfiles:

```bash
bootstrap           # skip conflicting files
bootstrap --force   # overwrite conflicting files
```

## Making Changes

To make changes to the repository, you can use the `dotfiles` alias as a `git` command:

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

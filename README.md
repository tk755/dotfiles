# 📂 Linux Dotfiles

This repository tracks my Linux scripts and config files, managed as a [bare repository](https://www.atlassian.com/git/tutorials/dotfiles) using [sparse checkout](https://git-scm.com/docs/git-sparse-checkout).

# 🚀 Installation

Use the `~/.bin/bootstrap` script to clone and check out this repo in a new or existing environment:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/tk755/dotfiles/main/.bin/bootstrap)
```

### Optional flags:
- `--headless`: Excludes GUI-related dotfiles for headless environments (like servers or WSL).
- `--force`: Overwrites conflicting files (like the default `.bashrc`).

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/tk755/dotfiles/main/.bin/bootstrap) --headless
bash <(curl -fsSL https://raw.githubusercontent.com/tk755/dotfiles/main/.bin/bootstrap) --force
bash <(curl -fsSL https://raw.githubusercontent.com/tk755/dotfiles/main/.bin/bootstrap) --headless --force
```

# 🔧 Using the Repository

After installation, use the `dotfiles` alias as a glorified `git` command to manage tracked files:

```bash
dotfiles status
dotfiles add $HOME/.bashrc
dotfiles commit -m 'update bashrc'
dotfiles push
```

# 🗂️ File Organization

### Scripts

User-level scripts are stored in `~/.bin/`:
- `~/.bin/` — scripts shared across all machines
- `~/.bin/<hostname>/` — scripts specific to a particular machine

Both paths are added to `$PATH`, with the `~/.bin/<hostname>/` directory taking precedence. This allows machine-specific scripts to override shared ones of the same name.

# Linux Dotfiles

This repository tracks my Linux scripts and config files, collectively referred to as *dotfiles*.

## Managing this Repository

This repository is managed as a [bare repository](https://www.atlassian.com/git/tutorials/dotfiles) using [sparse checkout](https://git-scm.com/docs/git-sparse-checkout).

### Installation

- The `.bin/bootstrap` script is used to set up this repository in a new or existing environment:

    ```bash
    bash <(curl -fsSL https://raw.githubusercontent.com/tk744/dotfiles/main/.bin/bootstrap)
    ```

- For headless environments (like servers or WSL), use the `--headless` option to exclude GUI-related dotfiles:

    ```bash
    bash <(curl -fsSL https://raw.githubusercontent.com/tk744/dotfiles/main/.bin/bootstrap) --headless
    ```

- To forcefully overwrite conflicting files (like the default `.bashrc`), use the `--force` option:

    ```bash
    bash <(curl -fsSL https://raw.githubusercontent.com/tk744/dotfiles/main/.bin/bootstrap) --force
    ``` 

- The `--headless` and `--force` options can also be combined if needed:

    ```bash
    bash <(curl -fsSL https://raw.githubusercontent.com/tk744/dotfiles/main/.bin/bootstrap) --headless --force
    ```

### Pushing and Pulling Changes

Use the `dotfiles` alias as a glorified `git` command to manage the repository in the usual way.

```bash
dotfiles status
dotfiles add $HOME/.bashrc
dotfiles commit -m 'updated .bashrc'
```

**NOTE:** You will need to reload your shell for the alias to take effect after installation.

## Orgainization

### Scripts

User-level scripts are stored in `~/.bin/`, organized as follows:
- `~/.bin/` — scripts shared across all machines
- `~/.bin/<hostname>/` — scripts specific to a particular machine

Both directories are added to `$PATH` allowing their scripts to be executed from anywhere. The `~/.bin/<hostname>/` directory takes precedence over `~/.bin/`, allowing machine-specific scripts to override shared ones of the same name.

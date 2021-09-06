# `~/.bash/`
This directory contains various Bash scripts and resources that are sourced from my `~/.bashrc` script.

## `~/.bash/aliases.sh`
This script defines Bash aliases and serves the same purpose as a `~/.bash_aliases` script.

## `~/.bash/path.sh`
This script modifies the `$PATH` environment variable to include additional executable program directories.

## `~/.bash/prompt.sh`
This script contains my Bash prompt customization code.

![broken image](screenshots/dracula.png)

The left side of the prompt contains the following segments:
- history number
- username
- hostname
- working directory
- git branch
- python virtual environment

The right side of the prompt contains the following segments:
- previous command execution time
- previous command exit code

## `~/.bash/splash`
The contents of this file are printed at the start of an interactive Bash session. It serves the purpose of a splash screen.

# environment variables and tools
if [ -f "$HOME/.bash/env.sh" ]; then
    . "$HOME/.bash/env.sh"
fi

# bash profile
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# auto-start X on login if available and on TTY1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ] && command -v startx >/dev/null 2>&1; then
  exec startx
fi

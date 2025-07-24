# bash profile
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# environment variables and tools
if [ -f "$HOME/.bash/env.sh" ]; then
    . "$HOME/.bash/env.sh"
fi

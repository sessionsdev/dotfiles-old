# Source the .alias file if it exists
if [ -f "$HOME/.alias" ]; then
    . "$HOME/.alias"
fi

# Source the .env file
if [ -f "$HOME/.env" ]; then
    . "$HOME/.env"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Source Rust's Cargo Environment (if it exists)
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

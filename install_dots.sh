#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

symlink_file() {
    local source_file="$1"
    local target_file="$2"

    # Check if a real file (not symlink) exists at the target location
    if [ -f "$target_file" ] && [ ! -L "$target_file" ]; then
        mv "$target_file" "$target_file.bak"  # Rename it to a .bak version
        echo "Backed up existing $target_file to $target_file.bak"
    fi

    # Create or overwrite the symlink
    ln -sf "$source_file" "$target_file"
    echo "Symlinked $source_file to $target_file"
}

# Symlink .profile
symlink_file "$DOTFILES_DIR/.profile" "$HOME/.profile"

# Symlink .zshrc
symlink_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Symlink .bashrc
symlink_file "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"

# Symlink .alias
symlink_file "$DOTFILES_DIR/.alias" "$HOME/.alias"

# Symlink .env
symlink_file "$DOTFILES_DIR/.env" "$HOME/.env"

# Symlink nvim config
symlink_file "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"

# Add any other files or configurations you want to symlink

echo "Dotfiles setup complete!"

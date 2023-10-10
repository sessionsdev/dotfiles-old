#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Ensure $HOME/.config directory exists
mkdir -p "$HOME/.config"

symlink_file() {
    local source_file="$1"
    local target_file="$2"

    # If a symlink exists at the target location, remove it
    if [ -L "$target_file" ]; then
        rm "$target_file"
        echo "Removed existing symlink $target_file"
    # If a directory exists at the target location, back it up
    elif [ -d "$target_file" ]; then
        mv "$target_file" "$target_file.bak"
        echo "Backed up existing directory $target_file to $target_file.bak"
    # Check if a real file exists at the target location
    elif [ -f "$target_file" ]; then
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

# Symlink .tmux.conf
symlink_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

# Symlink .gitconfig
symlink_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# Symlink .gitconfig
symlink_file "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"

# Add any other files or configurations you want to symlink

echo "Dotfiles setup complete!"

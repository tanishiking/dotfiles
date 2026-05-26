#!/bin/bash
set -e

DOTFILES_DIR=~/dotfiles

# Create symlink, replacing existing files/symlinks/directories safely
# -s: symbolic link
# -f: force (remove existing destination files)
# -n: treat symlink to directory as file (enables replacement)
link() {
    local src="$1"
    local dest="$2"

    # If destination is a real directory (not a symlink), back it up
    if [ -d "$dest" ] && [ ! -L "$dest" ]; then
        echo "Backing up existing directory: $dest -> ${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi

    ln -sfn "$src" "$dest"
    echo "Linked: $dest -> $src"
}

mkdir -p ~/.config ~/.codex ~/.local/bin

link "$DOTFILES_DIR/.zshenv" ~/.zshenv
link "$DOTFILES_DIR/.zsh" ~/.zsh
link "$DOTFILES_DIR/.config/nvim" ~/.config/nvim
link "$DOTFILES_DIR/.config/mise" ~/.config/mise
link "$DOTFILES_DIR/.config/git" ~/.config/git
link "$DOTFILES_DIR/.config/ghostty" ~/.config/ghostty
link "$DOTFILES_DIR/.config/zed" ~/.config/zed
link "$DOTFILES_DIR/.codex/hooks.json" ~/.codex/hooks.json

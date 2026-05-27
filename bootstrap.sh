#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/jacksonrushing/dotfiles.git"

# Clone if not present, pull if it is
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    git -C "$DOTFILES_DIR" pull
fi

# Backup any existing files, then symlink
backup_and_link() {
    local src="$1"
    local dst="$2"
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "$dst.backup.$(date +%s)"
    fi
    ln -sfn "$src" "$dst"
}

backup_and_link "$DOTFILES_DIR/tmux.conf"  "$HOME/.tmux.conf"
backup_and_link "$DOTFILES_DIR/bashrc"     "$HOME/.bashrc"
backup_and_link "$DOTFILES_DIR/gitconfig"  "$HOME/.gitconfig"
backup_and_link "$DOTFILES_DIR/inputrc"    "$HOME/.inputrc"

mkdir -p "$HOME/.config/micro"
backup_and_link "$DOTFILES_DIR/micro-settings.json" "$HOME/.config/micro/settings.json"

# Install nice-to-haves if missing (Ubuntu/Debian)
if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update -qq
    sudo apt-get install -y tmux git htop tree jq fzf ripgrep micro
fi

echo "✓ Dotfiles installed. Run: source ~/.bashrc"
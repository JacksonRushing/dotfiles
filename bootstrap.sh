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

# Install nice-to-haves (don't fail the whole script if one is unavailable)
if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update -qq
    for pkg in tmux git htop btop tree jq fzf ripgrep micro python3-pip; do
        sudo apt-get install -y "$pkg" || echo "⚠ couldn't install $pkg, skipping"
    done
fi

# nvitop for GPU monitoring (no-op on CPU boxes if pip missing or no GPU)
if command -v pip3 >/dev/null 2>&1; then
    pip3 install --user nvitop 2>/dev/null || echo "⚠ couldn't install nvitop, skipping"
fi

echo "✓ Dotfiles installed. Run: source ~/.bashrc"
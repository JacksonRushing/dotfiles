#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"

backup_and_link() {
    local src="$1"
    local dst="$2"
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "$dst.backup.$(date +%s)"
        echo "  backed up existing $dst → $dst.backup.*"
    fi
    ln -sfn "$src" "$dst"
    echo "  linked $dst → $src"
}

echo "Setting up Mac dotfiles..."

backup_and_link "$DOTFILES_DIR/zshrc"      "$HOME/.zshrc"
backup_and_link "$DOTFILES_DIR/gitconfig"  "$HOME/.gitconfig"
backup_and_link "$DOTFILES_DIR/tmux.conf"  "$HOME/.tmux.conf"

mkdir -p "$HOME/.config/micro"
backup_and_link "$DOTFILES_DIR/micro-settings.json" "$HOME/.config/micro/settings.json"

# Install Homebrew packages if missing
if command -v brew >/dev/null 2>&1; then
    for pkg in micro tmux htop btop ripgrep fzf jq starship; do
        brew list "$pkg" >/dev/null 2>&1 || brew install "$pkg"
    done
else
    echo "⚠ Homebrew not found — install from https://brew.sh"
fi

echo "✓ Mac dotfiles installed. Restart your shell or run: source ~/.zshrc"
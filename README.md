# Dotfiles

My config for EC2 dev instances.

## Install on a fresh box

\`\`\`bash
curl -fsSL https://raw.githubusercontent.com/jacksonrushing/dotfiles/main/bootstrap.sh | bash
source ~/.bashrc
\`\`\`

## What's in here

- `tmux.conf` — tmux with mouse mode, Ctrl-a prefix, sane splits
- `bashrc` — history sharing, aliases, prompt with git branch
- `gitconfig` — micro as editor, useful aliases (`git lg`, `git st`)
- `inputrc` — case-insensitive completion, prefix-matching history search
- `micro-settings.json` — mouse, soft wrap, saved undo/cursor
- `bootstrap.sh` — symlinks everything, installs packages
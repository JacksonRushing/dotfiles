# Source shared aliases and exports
[ -f ~/dotfiles/shell-common.sh ] && source ~/dotfiles/shell-common.sh

# --- zsh-specific: history ---
export HISTSIZE=50000
export SAVEHIST=100000
export HISTFILE=~/.zsh_history
setopt SHARE_HISTORY            # share history across sessions
setopt HIST_IGNORE_ALL_DUPS     # don't store duplicates
setopt HIST_IGNORE_SPACE        # commands starting with space aren't saved
setopt INC_APPEND_HISTORY       # write immediately, not on exit

# --- zsh-specific edit/reload aliases ---
alias zshrc='micro ~/.zshrc && source ~/.zshrc'
alias tmuxconf='micro ~/.tmux.conf && tmux source-file ~/.tmux.conf'

# --- Mac-specific aliases ---
alias ports='lsof -iTCP -sTCP:LISTEN -n -P'   # macOS equivalent
alias o='open .'                              # open current dir in Finder
alias chrome='open -a "Google Chrome"'

# --- SSH config sync (placeholder for the AWS auto-update script later) ---
# alias aws-ssh-sync='~/bin/aws-ssh-sync'

# --- Up/down arrow: prefix-matching history search (like the inputrc on Linux) ---
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# --- Starship prompt (must be at the end) ---
eval "$(starship init zsh)"
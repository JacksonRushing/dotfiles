# Source shared aliases and exports
[ -f ~/dotfiles/shell-common.sh ] && source ~/dotfiles/shell-common.sh

# --- Bash-specific: history ---
export HISTSIZE=50000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

# --- Bash prompt (only used on EC2, your Mac uses Starship) ---
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[33m\]$(parse_git_branch)\[\e[0m\]\$ '

# --- Bash-specific edit/reload aliases ---
alias bashrc='micro ~/.bashrc && source ~/.bashrc'
alias tmuxconf='micro ~/.tmux.conf && tmux source-file ~/.tmux.conf'

# --- fzf if installed ---
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
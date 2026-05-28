# --- History: bigger and shared across sessions ---
export HISTSIZE=50000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

# --- Default editor ---
export EDITOR=micro
export VISUAL=micro

# --- Better defaults ---
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# --- Workflow-specific ---
alias gpu='nvitop'
alias gpus='nvidia-smi'
alias dfh='df -h'
alias duh='du -h --max-depth=1 | sort -h'
alias ports='sudo netstat -tulpn'

# --- tmux helpers ---
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'

# --- Prompt: user@host:path (git branch) $ ---
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[33m\]$(parse_git_branch)\[\e[0m\]\$ '

# --- Safety nets ---
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# --- Python/ML workflow ---
alias py='python3'
alias ipy='ipython'
alias jl='jupyter lab --no-browser --port=8888'

# --- Quick edit + reload ---
alias bashrc='micro ~/.bashrc && source ~/.bashrc'
alias tmuxconf='micro ~/.tmux.conf && tmux source-file ~/.tmux.conf'
alias dotfiles-update='curl -fsSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/dotfiles/main/bootstrap.sh | bash && source ~/.bashrc'


# --- fzf if installed ---
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
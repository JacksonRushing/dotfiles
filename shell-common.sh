# --- Default editor ---
export EDITOR=micro
export VISUAL=micro

# --- PATH additions ---
export PATH="$HOME/.local/bin:$PATH"

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

# --- tmux helpers ---
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'

# --- Safety nets ---
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# --- Python/ML workflow ---
alias py='python3'
alias ipy='ipython'
alias jl='jupyter lab --no-browser --port=8888'

# --- Mouse-escape-code fix ---
alias fixmouse='printf "\e[?1000l\e[?1002l\e[?1003l\e[?1006l"; reset'

# --- Dotfiles management ---
alias dotfiles-update='curl -fsSL https://raw.githubusercontent.com/jacksonrushing/dotfiles/main/bootstrap.sh | bash && source ~/.bashrc'
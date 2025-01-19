export EDITOR=nvim
export PATH="/usr/lib/ccache/bin/:$PATH"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

if which brew &>/dev/null; then
  eval "$(brew shellenv)"
fi

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
source <(fzf --zsh)

eval "$(thefuck --alias)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(atuin init zsh)"

eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=$'\033[2mdirenv: %s\033[0m'

if [ -d /usr/share/zsh/plugins ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

autoload -Uz compinit; compinit

alias c='clear'
alias ls='eza --icons --git'
alias l='ls'
alias la='eza -a --icons --git'
alias ll='eza -al --icons --git'
alias lt='eza -a --tree --level=2 --icons --git'
alias shutdown='systemctl poweroff'
alias v='$EDITOR'
alias vim='$EDITOR'
alias wifi='nmtui'
alias diff='batdiff'

if [ -d /usr/share/nvm ]; then
  [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
  source /usr/share/nvm/nvm.sh
  source /usr/share/nvm/bash_completion
  source /usr/share/nvm/install-nvm-exec
fi


fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && ls; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | wl-copy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

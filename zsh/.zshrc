# .zshrc — interactive shell configuration

# ── 1Password SSH agent bridge ────────────────────────────────────────────────
# Bridges the Windows 1Password SSH agent into WSL2 via npiperelay + socat.
# Requires: npiperelay.exe on Windows PATH, socat installed in Arch.
# After wsl --shutdown + relaunch, all SSH auth flows through 1Password.
export SSH_AUTH_SOCK="${HOME}/.ssh/agent.sock"
if ! ss -a 2>/dev/null | grep -q "${SSH_AUTH_SOCK}"; then
  rm -f "${SSH_AUTH_SOCK}"
  ( setsid socat \
      UNIX-LISTEN:"${SSH_AUTH_SOCK}",fork \
      EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork \
    & ) 2>/dev/null
fi

# ── zinit ─────────────────────────────────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

# Completions
zinit snippet OMZP::git
zinit snippet OMZP::sudo
autoload -Uz compinit && compinit

# ── Dev toolchain init ────────────────────────────────────────────────────────
# pyenv
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init -)"
fi

# fnm (Fast Node Manager)
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

# Rust
[[ -f "${HOME}/.cargo/env" ]] && source "${HOME}/.cargo/env"

# ── fzf ───────────────────────────────────────────────────────────────────────
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi
if [[ -f /usr/share/fzf/completion.zsh ]]; then
  source /usr/share/fzf/completion.zsh
fi

# ── History ───────────────────────────────────────────────────────────────────
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ── Options ───────────────────────────────────────────────────────────────────
setopt AUTO_CD
setopt CORRECT
setopt NO_BEEP

# ── Aliases ───────────────────────────────────────────────────────────────────
# Modern CLI replacements
alias ls='eza'
alias ll='eza -la --git'
alias tree='eza --tree'
alias cat='bat'
alias grep='rg'
alias find='fd'

# Neovim
alias vim='nvim'
alias vi='nvim'

# Git shortcuts (beyond the omzp::git plugin)
alias gs='git status -sb'
alias gl='git lg'

# System
alias update='sudo pacman -Syu'
alias df='df -h'
alias du='du -ch'
alias ..='cd ..'
alias ...='cd ../..'

# WSL: open files/URLs in Windows
if command -v wslview &>/dev/null; then
  alias open='wslview'
fi

# ── Starship prompt ───────────────────────────────────────────────────────────
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

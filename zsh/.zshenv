# .zshenv — sourced for all zsh sessions (login, non-login, interactive, scripts)
# Keep this minimal: only env vars needed by all session types

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"

# Go
export GOPATH="${HOME}/go"
export PATH="${PATH}:/usr/local/go/bin:${GOPATH}/bin"

# Rust
export PATH="${PATH}:${HOME}/.cargo/bin"

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"

# Local binaries
export PATH="${HOME}/.local/bin:${PATH}"

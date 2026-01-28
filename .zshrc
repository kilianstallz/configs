# ~/.config/.zshrc

# --- Basic config ---
setopt prompt_subst
unsetopt BEEP

# Locale and editor
export LANG=de_AT.UTF-8
export EDITOR="/opt/homebrew/bin/nvim"

# --- PATH and environment ---
# Local bins first for overrides
export PATH="$HOME/.local/bin:$PATH"

# Homebrew shellenv
if command -v brew >/dev/null 2>&1; then
  eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || eval "$(brew shellenv)"
fi

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# .NET
export PATH="$HOME/.dotnet:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export DOTNET_ROOT="$HOME/.dotnet"

# Postgres.app (macOS)
if [ -d "/Applications/Postgres.app/Contents/Versions/latest/bin" ]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Keploy & Antigravity
export PATH="$HOME/.keploy/bin:$PATH"
export PATH="/Users/kilianstallinger/.antigravity/antigravity/bin:$PATH"

# --- Completions & fpath (MOVED UP) ---
# MUST run before tools like kubectl or fzf source their completion scripts

# Add local completions directory
fpath=("$HOME/.zsh/completions" $fpath)

# Add Homebrew site-functions to FPATH
if command -v brew >/dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi

# Initialize completion system
autoload -Uz compinit
# Configure completion style
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
compinit 2>/dev/null || true

# --- Plugin / tool initializers ---

# kubectl completion (Now safe to call)
if command -v kubectl >/dev/null 2>&1; then
  # bashcompinit is often needed for k8s plugins/aliases
  autoload -Uz bashcompinit 2>/dev/null && bashcompinit 2>/dev/null || true
  if kubectl completion zsh >/dev/null 2>&1; then
    source <(kubectl completion zsh)
  fi
fi

# pyenv
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)" 2>/dev/null || true
  eval "$(pyenv init -)" 2>/dev/null || true
fi

# starship prompt
if command -v starship >/dev/null 2>&1; then
  export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
  eval "$(starship init zsh)" 2>/dev/null || true
fi

# fzf
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh) 2>/dev/null || true
fi

# zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)" 2>/dev/null || true
fi

# atuin
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh)" 2>/dev/null || true
fi

# direnv
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)" 2>/dev/null || true
fi

# autosuggestions
if command -v brew >/dev/null 2>&1 && [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  bindkey '^w' autosuggest-execute
  bindkey '^e' autosuggest-accept
  bindkey '^u' autosuggest-toggle
  bindkey '^L' vi-forward-word
  bindkey '^k' up-line-or-search
  bindkey '^j' down-line-or-search
fi

# mise (activate after completions)
eval "$(mise activate zsh)"

# --- Keybindings ---
bindkey -v
bindkey 'jk' vi-cmd-mode 2>/dev/null || true

# --- Aliases ---
if [ -f "$HOME/.config/zsh/aliases.zsh" ]; then
  source "$HOME/.config/zsh/aliases.zsh"
elif [ -f "$HOME/zsh/aliases.zsh" ]; then
  source "$HOME/zsh/aliases.zsh"
fi

# SOPS
SOPS_AGE_KEY_FILE=$HOME/.sops/key.txt

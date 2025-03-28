# Custom configurations
source ~/.config/zsh/custom.zsh

# Enable case-insensitive autocompletion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Disable bell
unsetopt BEEP

# Various initializers

# pnpm
export PNPM_HOME="/Users/kilianstallinger/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

# Created by `pipx` on 2025-02-07 12:34:51
export PATH="$PATH:/Users/kilianstallinger/.local/bin"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
source <(fzf --zsh) # fzf key binds and fuzzy completion 
eval "$(/opt/homebrew/bin/brew shellenv)"

# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null ||
  {
    eval "$(/usr/local/bin/starship init zsh)"
  }

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
eval "$(/opt/homebrew/bin/brew shellenv)"


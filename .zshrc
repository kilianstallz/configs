source ~/.config/zsh/main.zsh

export EDITOR=/opt/homebrew/bin/nvim


export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.dotnet/tools


# console ninja
PATH=~/.console-ninja/.bin:$PATH



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kilianstallinger/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kilianstallinger/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kilianstallinger/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kilianstallinger/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/kilianstallinger/.bun/_bun" ] && source "/Users/kilianstallinger/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/kilianstallinger/.opam/opam-init/init.zsh' ]] || source '/Users/kilianstallinger/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration


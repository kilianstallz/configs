alias ls='eza --icons --git'
alias ll='ls -l --icons --git -a --group-directories-first'
alias lt='ls --tree --level=2 --long --icons --git --group-directories-first'
alias v="nvim"
alias vc="nvim ."
alias cat="bat"
alias c="clear"
alias cl='clear'
alias s="source $HOME/.zshrc"
alias fc="nvim $HOME/.zshrc"
alias find='fd'
# alias grep='rg'
alias la=tree


alias fcpxreset='rm ~/Library/Application\ Support/.ffuserdata'

# Git
alias gp='git push'
alias gl='git pull'
alias gm='git merge'
alias gmc='git merge --continue'
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias ga='git add'
alias gcm='git commit -m'
alias grm='git checkout origin/master -- '
alias grh='git checkout HEAD -- '
alias gby="git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy"
alias ecm='git commit --allow-empty -m "trigger ci" && git push'
alias lg="lazygit"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"


alias tma='tmux attach -t'
alias x='clear && tmux clear-history'


# Docker
alias d="docker"
alias dc="docker-compose"
alias dcb="docker-compose build"
alias dcd="docker-compose down"
alias dce="docker-compose exec"
alias dcl="docker-compose logs"
alias dcu="docker-compose up"
alias dcr="dcd && dcu -d"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Nmap
alias nm="nmap -sC -sV -oN nmap"

# FS
alias '..'="cd .."
alias '...'="cd ../.."
alias '....'="cd ../../.."
alias '.....'="cd ../../../.."

# k8s
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"


# Quick jj commands
alias jn='jj new'
alias js='jj status'
alias jl='jj log'
alias jd='jj diff'
alias jf='jj git fetch'

# Abandon empty commits automatically
alias ja='jj abandon'

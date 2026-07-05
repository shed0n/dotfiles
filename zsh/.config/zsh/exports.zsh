#!/bin/sh
#export GOPATH=$HOME/go
#export GO111MODULE=auto
#export GITLAB_TOKEN=""
#export GITLAB_REGISTRY_TOKEN=""

#export VAULT_TOKEN_NAME=mathue
#export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export PATH=$PATH:"/home/shedon/bin"
export PATH="$HOME/.local/bin":$PATH

#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
#source <(fzf --zsh)

#flux
#command -v flux >/dev/null && . <(flux completion zsh)

#source <(kubectl completion bash)
#complete -o default -F __start_kubectl k

#export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#!/bin/sh

# lines 4-17 used by raw system like ubuntu, 19 below is for cachy
# 50 below is work related

# enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     #alias ls='ls --color=auto'
#     alias dir='dir --color=auto'
#     alias vdir='vdir --color=auto'
#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi

# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

# list alias
alias ls='eza -al --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias ll='eza -l --color=always --group-directories-first --icons'
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'"                                   # only dotfiles

# alias for random stuff
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias update='sudo pacman -Syu'
alias jctl="journalctl -p 3 -xb"
alias wget='wget -c '
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias hw='hwinfo --short'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias big="expac -H M '%m\t%n' | sort -h | nl"                                # sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'                            # list amount of -git packages
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" # recent installed packages


#alias k=kubectl
#alias kd='kubectl describe'
#alias kdp='kubectl describe pod'
#alias kdd='kubectl describe deployment'
#alias kubekind='cp /home/matheus.guedes/.kube/config-kind /home/matheus.guedes/.kube/config'
#alias kubecloud='cp /home/matheus.guedes/.kube/config-cloud /home/matheus.guedes/.kube/config'
#alias create-token="/home/matheus.guedes/git/hashicorp-vault/create-token.sh"
#alias vl='vault login -method=oidc role=devops'
#alias aws_lab="aws sso login --profile lab"
#alias aws_staging="aws sso login --profile staging"
#alias aws_prod="aws sso login --profile production"
#Old auth method production
#alias aws_vault_prod="/usr/local/bin/admin-aws.sh --environment=production-vault --region=eu-west-1 && echo 'Creating AWS account. It may take up to 10 seconds for it to propagate.' && sleep 10 && aws sts get-caller-identity --profile production-vault | jq '.Arn'"

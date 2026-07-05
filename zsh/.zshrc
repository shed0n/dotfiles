# zplug source
export ZPLUG_HOME=/home/shedon/.zplug/
source $ZPLUG_HOME/init.zsh

# append to the history file, don't overwrite it
HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt interactivecomments
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# keybinds
# bindkey '^ ' autosuggest-accept
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3~" delete-char

# source local plugins
zplug "$HOME/.config/zsh", from:local
# external plugins
# zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "Aloxaf/fzf-tab"

# loads everything
zplug load
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#576064'

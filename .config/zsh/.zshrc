#!/usr/bin/env zsh

##### BINDING STYLE
bindkey -v
export KEYTIMEOUT=1

##### SET OPTIONS
setopt globdots
setopt extendedglob
setopt rc_quotes
setopt notify
setopt correct
setopt no_clobber
setopt complete_in_word
setopt always_to_end
setopt path_dirs
setopt auto_menu
setopt auto_list
# setopt menu_complete
setopt appendhistory notify
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt auto_pushd
setopt pushd_silent
setopt pushd_ignore_dups
setopt pushd_minus
setopt transientrprompt
setopt print_exit_value

##### FUNCTIONS
export ZFUNCDIR="${ZFUNCDIR:-$ZDOTDIR/functions}"
fpath+="${ZFUNCDIR:-$ZDOTDIR/functions}"
autoload -Uz $fpath[-1]/*(.:t)

##### PROMPT & COMPLETION
export PURE_PROMPT="${PURE_PROMPT:-$ZDOTDIR/prompt/pure}"
fpath=($PURE_PROMPT $fpath)
autoload -Uz compinit promptinit 
compinit && promptinit
transient_prompt
prompt pure

##### ZSTYLE
zstyle ':completion:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion::complete:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' rehash true
zmodload zsh/complist

##### FZF
if [[ -d /usr/share/fzf ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

##### EMACS EAT
[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && source "$EAT_SHELL_INTEGRATION_DIR/zsh"

##### ALIASES
source "${ZDOTDIR:-~}/.aliases"

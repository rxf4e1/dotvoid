#!/bin/zsh
#
# .zprofile - Zsh file loaded on login.
#

##### Environment
export BROWSER="${BROWSER:-firefox}"
export EDITOR="${EDITOR:-emacs}"
export VISUAL="${VISUAL:-emacs}"

##### Paths
# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/.local/{,s}bin(N)
  $HOME/.cargo/bin(N)
  /usr/local/{,s}bin(N)
  $(npm config --global get prefix)/bin(N)
  $path
)

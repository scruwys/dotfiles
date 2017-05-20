#!/usr/bin/env bash

# Declare any relevant parameters...
ruby_version="2.32"
nvm_version="6"

# Get absolute path of dotfiles directory...
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlinks and the dotfile magic...
# => TBD


# Set settings for OS X...
. "$DOTFILES_DIR/osx/set-defaults.sh"

# Install package managers and base packages...
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/npm.sh" $nvm_version
. "$DOTFILES_DIR/install/rvm.sh" $ruby_version

if [ "$(uname)" == "Darwin" ]; then
  . "$DOTFILES_DIR/install/bash.sh"
  . "$DOTFILES_DIR/install/brew-cask.sh"
fi


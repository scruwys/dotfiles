# !/usr/bin/env bash

# Declare any relevant parameters...
ruby_version="2.41"
nvm_version="6"

git_name="Scott Cruwys"
git_email="scruwys@gmail.com"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Get absolute path of dotfiles directory...
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlinks and the dotfile magic...
ln -sfv "$DOTFILES_DIR/system/.zshrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# Include functions, as they are essential to installation
source system/.functions

# Set settings for OS X...
. "$DOTFILES_DIR/osx/set-defaults.sh"

# Install package managers and base packages...
. "$DOTFILES_DIR/install/brew.sh"
# . "$DOTFILES_DIR/install/npm.sh" $nvm_version
. "$DOTFILES_DIR/install/rvm.sh" $ruby_version

if [ "$(uname)" == "Darwin" ]; then
  . "$DOTFILES_DIR/install/bash.sh"
  . "$DOTFILES_DIR/install/brew-cask.sh"
fi

# Set settings for iTerm 2...
. "$DOTFILES_DIR/iterm/set-defaults.sh"

if is-executable git; then
  git config --global user.name $git_name
  git config --global user.email $git_email
fi

dockutil --remove all
dockutil --add "/Applications/Google Chrome.app"
dockutil --add "/Applications/Sublime Text.app"
dockutil --add "/Applications/Spotify.app"
dockutil --add "/Applications/Slack.app"
dockutil --add "/Applications/Google Drive.app"
dockutil --add "/Applications/iTerm.app"

open "/Applications/Flux.app"
open "/Applications/Cinch.app"
open "/Applications/Quicksilver.app"


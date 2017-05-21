# !/usr/bin/env bash

if ! is-executable ruby -o ! is-executable curl -o; then
  echo "Skipped: Homebrew (not found: ruby and/or curl)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if ! is-executable brew; then
  echo "Skipping: Homebrew packages (not found: brew)"
  return
fi

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery
brew update
brew upgrade

# Install base packages...

brew install git

apps=(
  wget
  battery
  coreutils
  dockutil
  ffmpeg
  nvm
  shpotify
  imagemagick
  mysql
  awscli
  unrar
  the_silver_searcher
)

brew install "${apps[@]}"
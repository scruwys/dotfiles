!/usr/bin/env bash

if ! is-executable brew; then
  echo "Skipping: Homebrew-Cask (not found: brew)"
  return
fi

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install base applications...

apps=(
  anaconda
  firefox
  flux
  google-chrome
  google-drive
  quicksilver
  slack
  spotify
  sublime-text
  transmit
  virtualbox
  vlc
)

brew cask install "${apps[@]}"
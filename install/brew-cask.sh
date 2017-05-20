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
  # airmail
  # firefox
  # flux
  # google-chrome
  # google-drive
  # iterm2
  # java
  # quicksilver
  # slack
  # spotify
  # sublime-text
  # transmit
  # vagrant
  # virtualbox
  # vlc
)

brew cask install "${apps[@]}"
#!/usr/bin/env bash

if ! is-executable brew -o ! is-executable git; then
  echo "Skipped: npm (missing: brew and/or git)"
  return
fi

# Install nvm and node...

brew install node
brew install npm

# Install base packages...

packages=(
  yarn
  gulp
)

npm install -g "${packages[@]}"

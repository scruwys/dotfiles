#!/usr/bin/env bash

if ! is-executable brew -o ! is-executable git; then
  echo "Skipped: npm (missing: brew and/or git)"
  return
fi

Install nvm and node...
brew install nvm
nvm install $1

Install base packages...

packages=(
  bower
  gulp
)

npm install -g "${packages[@]}"
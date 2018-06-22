#!/usr/bin/env bash

if ! is-executable curl -o ! is-executable git; then
  echo "Skipped: pyenv (missing: curl and/or git)"
  return
fi

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

cat <<EOT >> ~/.zshrc
# pyenv configuration
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOT

versions=(
  "2.7.1"
  "3.6.5"
)

pyenv install "${versions[@]}"
pyenv global 3.6.5

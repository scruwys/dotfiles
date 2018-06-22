#!/usr/bin/env bash

if ! is-executable brew; then
  echo "Skipped: hashicorp (missing: brew)"
  return
fi

hashicorp=(
  terraform
  consul
  nomad
  vault
)

brew install "${hashicorp[@]}"

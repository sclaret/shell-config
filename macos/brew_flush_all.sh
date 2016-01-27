#! /usr/bin/env bash

set -e

set -o xtrace

sudo chsh -s /bin/bash $USER

if [[ "$(brew list)" == "" ]]; then
  echo "Brew list is empty:"
  brew list
else
  echo "Brew list is not empty:"
  brew list
  brew remove --force $(brew list) --ignore-dependencies
fi

brew cleanup

brew cleanup -s

rm -rf "$(brew --cache)"

brew update

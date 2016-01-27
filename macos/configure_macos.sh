#! /usr/bin/env bash

set -e

defaults write com.apple.dock tilesize -int 20 && killall Dock

defaults write com.apple.dock workspaces-edge-delay -float 10; killall Dock

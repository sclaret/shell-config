#! /usr/bin/env bash

set -e

sudo chsh -s /usr/local/bin/bash $USER

# Launch emacs from terminal, Options, "Keep in Dock"

brew services start emacs

# Gitup Failed connecting to "origin" remote: authentication required but no callback set? 
#ssh-add ~/.ssh/id_rsa


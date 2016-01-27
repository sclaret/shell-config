#! /usr/bin/env bash

#set -o xtrace

function link_config {
  echo -n "Linking $2... "
  if [[ -h $2 ]]; then
    echo "link exists, skipping"
    return
  elif [[ -f $2 ]]; then
    echo "file exists, backing up"
    ~/customize/dotfiles/bin/trash $2
  elif [[ -d $2 ]]; then
    echo "directory exists, backing up"
    ~/customize/dotfiles/bin/trash $2
  else
    echo "succeeded"
  fi
  mkdir -p $(dirname $2)
  (set -x; ln -s $1 $2)
}

link_config $PWD/.config ~/.config

link_config $PWD/.bash_profile ~/.bash_profile
link_config $PWD/.bashrc ~/.bashrc
link_config $PWD/.bash_aliases ~/.bash_aliases

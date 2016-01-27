#! /usr/bin/env bash

function activate_private_dotfiles {
  _c_files=$(ls $1)
  for _c_file in $_c_files; do
    if [[ -d $CUSTOMIZE_DIR/$_c_file ]]; then
      p='^dotfiles-private.*$'
      if [[ $_c_file =~ $p ]]; then
        source $CUSTOMIZE_DIR/$_c_file/.bashrc
      fi
    fi
  done
}

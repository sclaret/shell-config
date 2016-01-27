if [[ -n $PS1 ]]; then

  if [[ "${BASH_VERSINFO[0]}" -lt "4" ]]; then
    echo "Warning: this bash interpreter is old ($BASH_VERSION)"
  fi

  function get_source_dir {
    _source_file=${BASH_SOURCE[1]}
    if [[ -h $_source_file ]]; then
      _source_file=$(readlink $_source_file)
    fi
    dirname $_source_file
  }

  DOTFILES_DIR=$(get_source_dir)
  CUSTOMIZE_DIR=$(dirname $DOTFILES_DIR)

  export EDITOR="emacs -nw"
  export PAGER="less"
  export XDG_CONFIG_HOME=~/.config

  source ~/.bash_aliases

  export PATH=$PATH:$DOTFILES_DIR/bin
  source <(cat $DOTFILES_DIR/lib/*.sh)

  configure_prompt 3

  activate_completions
  activate_environments
  activate_runtimes
  activate_private_dotfiles $CUSTOMIZE_DIR

fi

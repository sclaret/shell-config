#! /usr/bin/env bash

function activate_runtimes {
  pattern="^.*darwin.*$"
  if [[ $OSTYPE =~ $pattern ]]; then
    #echo "Placing brew bindir early in PATH"
    export PATH=/usr/local/bin:$PATH
  fi

  if type -P pyenv &>/dev/null; then
    #echo "Starting pyenv"
    eval "$(pyenv init -)" # Completions, shims, PATH
  fi

  if [[ -f /usr/local/opt/nvm/nvm.sh ]]; then
    #echo "Starting nvm"
    mkdir -p $HOME/.nvm
    export NVM_DIR="$HOME/.nvm"
    . "/usr/local/opt/nvm/nvm.sh" # PATH, ENV
  fi
}

## Runtimes
#
#``` bash
#pyenv install 3.6.4
#pyenv global 3.6.4
#```



#! /usr/bin/env bash

function configure_prompt {
  if [[ $# -eq 0 ]]; then
    PROMPT_DIRTRIM=1
  else
    PROMPT_DIRTRIM=$1
  fi
  if [[ $EUID == 0 ]] ; then
    PS1='\[\033[01;31m\][\h\[\033[01;36m\] \w\[\033[01;31m\]]\$\[\033[00m\] '
  else
    PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \w\[\033[01;32m\]]\$\[\033[00m\] '
  fi

  if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    GIT_PROMPT_ONLY_IN_REPO=1
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
  fi
}

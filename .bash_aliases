#! /usr/bin/env bash

alias ll="ls -alh"
alias rw='function _inner(){ set -x; tmutil localsnapshot; rm -rf "$@"; set +x; };_inner'


# sudo su
alias supe="sudo -E bash"


alias w="cd ~/workspace"
alias s="cd ~/workspace/scratch"
alias d="cd ~/workspace/deploy"
alias h="cd ~"


alias ms="mount_snapshots workspace"
alias ums="unmount_snapshots"


alias gs="git status"
alias gl="git log"
alias glp="git log -p"

alias ga="git add"
alias grm="git rm"
alias gmv="git mv"

alias gd="git diff"
alias gdc="git diff --cached"

alias gc="git commit"
alias gca="git commit --amend --reuse-message=HEAD"

alias gp="git push"
alias gpf="git push --force"


alias v="vim"
alias e="emacs -nw"


alias tl="cd /var/log; tail -f *.log"


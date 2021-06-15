#! /usr/bin/env bash

alias ll="ls -alh"
alias rmm="rm -rf"


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

alias gst="git stash"
alias gstp="git stash pop"

alias gres="git reset HEAD~1"

alias greb="git rebase -i" #HEAD~3


alias v="vim"
alias e="emacs -nw"


alias tl="cd /var/log; tail -f *.log"


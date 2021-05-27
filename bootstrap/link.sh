#! /usr/bin/env bash

set +x

function link_config {
  echo "Need a symbolic link pointing to"
  echo "source_file $1"
  echo "from link_name $2" 
  set -x
  if [[ -h $2 ]]; then
    echo "$2 is a symbolic link"
    rm $2
  elif [[ -f $2 ]]; then
    tput smso
    echo "$2 is a file"
    mv $2 $2$(date +%s)
    tput rmso
  elif [[ -d $2 ]]; then
    tput smso
    echo "$2 is a directory"
    mv $2 $2$(date +%s)
    tput rmso
  else
    echo "$2 does not exist"
  fi
  ln -vs $1 $2
  set +x
  echo
}

link_config $PWD/.config ~/.config

link_config $PWD/.bash_profile ~/.bash_profile
link_config $PWD/.bashrc ~/.bashrc
link_config $PWD/.bash_aliases ~/.bash_aliases


set -x
# Check config files working
git config user.name
git config user.email
set +x

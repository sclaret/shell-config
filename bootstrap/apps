#! /usr/bin/env bash

apps=""

if [[ $(type -t git) == "file" ]]; then
	echo "git: X"
else
	echo "git: O"
	apps+=" git"
fi

if [[ $(type -t vim) == "file" ]]; then
	echo "vim: X"
else
	echo "vim: O"
	apps+=" vim"
fi

echo

if [[ -z $apps ]]; then
	echo "All apps found"
	exit 0
fi

if [[ $(type -t brew) == "file" ]]; then	
	echo "Please run: "
	echo "brew update"
	echo "brew install$apps"
	exit 0
elif [[ $(type -t apt) == "file" ]]; then
	echo "Please run: "
	echo "su -c \"apt install$apps\""
	exit 0
elif [[ $(type -t apt) == "file" ]]; then
	echo "Please run: "
	echo "su -c \"pacman -Sy$apps\""
	exit 0
else
	echo "Please install:$apps"
	exit 1
fi

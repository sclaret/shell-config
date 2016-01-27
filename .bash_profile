# LOGIN SHELL --> .bash_profile --> command prompt
#   e.g. login from a console or via ssh
#
# NON-LOGIN SHELL --> .bashrc --> command prompt
#   e.g. launch new terminal window
#   e.g. start new bash instance (/bin/bash in terminal)
#
# OSX is an exception to the terminal window guidelines:
# a login shell is run for every new terminal window

if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

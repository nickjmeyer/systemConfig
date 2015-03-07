#
# ~/.bash_profile
#

eval $(ssh-agent)

emacs --daemon -u $USER

[[ -f ~/.bashrc ]] && . ~/.bashrc

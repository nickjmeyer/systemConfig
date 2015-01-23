#
# ~/.bash_profile
#

eval $(ssh-agent)

emacs --daemon -u $USER

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

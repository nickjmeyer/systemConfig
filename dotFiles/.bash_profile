#
# ~/.bash_profile
#

eval $(ssh-agent)

## turn off bell
# if [ -n "$DISPLAY" ]; then
xset b off
# fi

emacs --daemon -u $USER

[[ -f ~/.bashrc ]] && . ~/.bashrc

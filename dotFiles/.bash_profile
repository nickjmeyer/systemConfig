#
# ~/.bash_profile
#

eval $(ssh-agent)

## turn off bell
# if [ -n "$DISPLAY" ]; then
xset b off
# fi

# emacs --daemon

[[ -f ~/.bashrc ]] && . ~/.bashrc

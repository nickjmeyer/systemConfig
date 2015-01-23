## disable the touchpad
if which synclient > /dev/null 2>&1
then
    synclient TouchpadOff=1
fi

## disable the system bell
xset -b

## enable key bindings in .xbindkeys
xbindkeys

## enable settings in .Xresources
xrdb ~/.Xresources

# ## hybrid-sleep after 20 minutes of inactivity
# xautolock -time 20 -locker "systemctl hybrid-sleep" -detectsleep &

## start dropbox
dropboxd &

## start awesome and launch dbus for automatic usb mounting via nautilus
exec dbus-launch --exit-with-session --sh-syntax awesome
# exec dbus-launch --exit-with-session --sh-syntax qtile

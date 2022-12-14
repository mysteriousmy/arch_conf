#!/bin/bash
# require ydotool https://github.com/ReimuNotMoe/ydotool and jq
# key code see /usr/include/linux/input-event-codes.h
option=$1
envir=$XDG_SESSION_TYPE
commands=""
if ([ $envir == "wayland" ]); then
    commands=$(hyprctl monitors -j | jq '.[0].activeWorkspace.id')
else
    commands=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).num')
fi
case ${option} in
next)
    if ([ $envir != "wayland" ]); then
        ydotool key 125:1 $(expr $commands + 2):1 125:0 $(expr $commands + 2):0
    fi
    #xdotool key Super_L+`expr $a + 1`
    ;;
previous)
    if ([ $envir != "wayland" ]); then
        ydotool key 125:1 $(expr $commands):1 125:0 $(expr $commands):0
    fi
    ;;
win_next)
    ydotool key 125:1 42:1 $(expr $commands + 2):1 125:0 42:0 $(expr $commands + 2):0
    ;;
win_previous)
    ydotool key 125:1 42:1 $(expr $commands):1 125:0 42:0 $(expr $commands):0
    ;;
*)
    echo "null"
    ;;
esac

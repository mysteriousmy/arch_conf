#!/bin/bash
option=$1
a=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).num')
case ${option} in
    next)
        xdotool key Super_L+`expr $a + 1`
    ;;
    previous)
        xdotool key Super_L+`expr $a - 1`
    ;;
    win_next)
        xdotool key Super_L+shift+`expr $a + 1`
    ;;
    win_previous)
        xdotool key Super_L+shift+`expr $a - 1`
    ;;
    *)
        echo "null"
    ;;
esac

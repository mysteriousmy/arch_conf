#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dir="$HOME/.config/rofi/applets/android"
rofi_command="rofi -theme $dir/six.rasi"

# Links
terminal=""
check="$(ps -ef |grep "clash" | awk '{print $3}' | sed -n '1p')"
#vpncheck="$(ps -ef | grep "openvpn" | awk '{print $3}' | sed -n '1p')"
echo $check
if [[ $check == 1 ]]; then
  # terminal=""
    terminal=""
else
  # terminal=""
    terminal=""
fi

#if [[ $vpncheck != '1' ]]; then
#   openvpn=""
#else
#   openvpn=""
#fi

files=""
editor=""
browser=""
music=""
settings=""

# Error msg
msg() {
	rofi -theme "$dir/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$terminal\n$files\n$editor\n$browser\n$music\n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
	     if [[ $check == '1' ]]; then
#		ps -ef | grep clash | awk '{print $2}' | xargs kill -9
		systemctl stop clash
		msg "关闭clash成功！"
	     else
#		/home/jack/software/clash-for-linux/bin/clash-linux-amd64 -d /home/jack/software/clash-for-linux/bin/ &
		systemctl start clash
		msg "启动clash成功!"
	     fi
        ;;
#    $openvpn)
#             if [[ $vpncheck == '1' ]]; then
#		systemctl stop openvpn
#		msg "关闭openvpn成功！"
#	     else
#		systemctl start openvpn
#		msg "启动openvpn成功！"
#	     fi
#	;;		
    $files)
		if [[ -f /usr/bin/thunar ]]; then
			thunar &
		elif [[ -f /usr/bin/pcmanfm ]]; then
			pcmanfm &
		else
			msg "No suitable file manager found!"
		fi
        ;;
    $editor)
		if [[ -f /usr/bin/geany ]]; then
			geany &
		elif [[ -f /usr/bin/leafpad ]]; then
			leafpad &
		elif [[ -f /usr/bin/mousepad ]]; then
			mousepad &
		elif [[ -f /usr/bin/code ]]; then
			code &
		else
			msg "No suitable text editor found!"
		fi
        ;;
    $browser)
		if [[ -f /usr/bin/firefox ]]; then
			firefox &
		elif [[ -f /usr/bin/chromium ]]; then
			chromium &
		elif [[ -f /usr/bin/midori ]]; then
			midori &
		elif [[ -f /usr/bin/microsoft-edge-dev ]]; then
			microsoft-edge-dev &
		else
			msg "No suitable web browser found!"
		fi
        ;;
    $music)
		if [[ -f /usr/bin/lxmusic ]]; then
			lxmusic &
		else
			netease-cloud-music &
		fi
        ;;
    $settings)
		if [[ -f /usr/bin/xfce4-settings-manager ]]; then
			xfce4-settings-manager &
		else
			msg "No suitable settings manager found!"
		fi
        ;;
esac

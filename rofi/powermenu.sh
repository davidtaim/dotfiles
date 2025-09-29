#!/usr/bin/env bash

confirm_dialog="Confirm"
yes=" Yes"
no=" No"

option_1="⏻ Shutdown"
option_2=" Reboot"
option_3="󰗽 Logout"

confirm() {
    yesno="$yes\n$no"
    echo -e $yesno | rofi -dmenu -mesg "  Are you sure?" -theme confirm.rasi
}

powermenu() {
    options="$option_1\n$option_2\n$option_3"
    echo -e "$options" | rofi -dmenu -mesg "󱘖 Energy Options" -theme powermenu.rasi
}

chosen="$(powermenu)"

case "$chosen" in
    $option_1)
        ans=$(confirm &)
        if [[ "$ans" == "$yes" ]]; then
            systemctl poweroff
        elif [[ "$ans" == "$no" ]]; then
            exit 0
        fi
        ;;
    $option_2)
        ans=$(confirm &)
        if [[ "$ans" == "$yes" ]]; then
            systemctl reboot
        elif [[ "$ans" == "$no" ]]; then
            exit 0
        fi
        ;;
    $option_3)
        ans=$(confirm &)
        if [[ "$ans" == "$yes" ]]; then
            pgrep -fa mediaplayer.py | awk {'print $1'} | xargs kill -9
            hyprctl dispatch exit
        elif [[ "$ans" == "$no" ]]; then
            exit 0
        fi
        ;;
esac

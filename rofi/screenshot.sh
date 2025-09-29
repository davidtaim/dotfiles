#!/usr/bin/env bash

# Screenshot
time=`date +%Y-%m-%d-%H-%M-%S`
dir="$HOME/Pictures/Screenshots"
file="Screenshot_${time}.png"

# Directory
if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

mesg=" Screenshot Options"
option_1=" Active Window"
option_2="󰲎 Selected Area"
option_3=" Dekstop"
monitors=$(hyprctl monitors -j | jq -r 'map("󰍹 " + .["name"]) | join("\\n")')

screenshot() {
    options="$option_1\n$option_2\n$option_3\n$monitors"
    echo -e "$options" | rofi -dmenu -mesg "$mesg" -theme screenshot.rasi
}

sound() {
    paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga &>/dev/null &
}

notify() {
    sound
    option=$(notify-send -a "Screenshot tool" -t 8000 -i gnome-screenshot "Screenshot" "Copied to clipboard" -A "View" -A "Edit")
    if [[ $option == 0 ]]; then
        imv-dir $dir/$file &
    elif [[ $option == 1 ]]; then
        swappy -f $dir/$file -o $dir/$file &
    fi
}

chosen="$(screenshot)"

if [[ $chosen == "" ]]; then
    exit
fi

case "$chosen" in
    $option_1)
        sleep 0.2 && hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - - | tee $dir/$file | wl-copy
        notify
        ;;
    $option_2)
        slurp | grim -g - - | tee $dir/$file | wl-copy
        notify
        ;;
    $option_3)
        sleep 0.2 && grim - | tee $dir/$file | wl-copy
        notify
        ;;
    *)
        monitor="${chosen#??}"
        transform=$(hyprctl monitors -j | jq -r ".[] | select(.name == \"$monitor\") | \"\(.transform)\"")
        if [[ $transform = 0 ]]; then
            geom=$(hyprctl monitors -j | jq -r ".[] | select(.name == \"$monitor\") | \"\(.x),\(.y) \(.width)x\(.height)\"")
        else
            geom=$(hyprctl monitors -j | jq -r ".[] | select(.name == \"$monitor\") | \"\(.x),\(.y) \(.height)x\(.width)\"" )
        fi
        sleep 0.2 && grim -g "$geom" - | tee $dir/$file | wl-copy
        notify
        ;;
esac

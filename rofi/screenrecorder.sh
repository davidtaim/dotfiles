#!/usr/bin/env bash

# Screenrecorder
time=`date +%Y-%m-%d-%H-%M-%S`
dir="$HOME/Videos/Screenrecords"
file="Screenrecord_${time}.mkv"

# Directory
if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

msg=" Simple Screenrecorder"
option_1=" Active Window"
option_2="󰩬 Selected Area"
monitors=$(hyprctl monitors -j | jq -r 'map("󰍹 " + .["name"]) | join("\\n")')

screenrecorder() {
    options="$option_1\n$option_2\n$monitors"
    echo -e "$options" | rofi -dmenu -mesg "$msg" -theme screenrecorder.rasi
}

notify() {
    option=$(notify-send -a "Screenrecorder" -t 8000 -i simplescreenrecorder "Screenrecorder" "Saved: Videos/Screenrecords/$file" -A "View")
    if [[ $option == 0 ]];then
        mpv $dir/$file &
    fi
}

notify_delay() {
    NID=0
    for i in 5 4 3 2 1; do
        NID=$(notify-send -a "Screenrecorder" -i simplescreenrecorder "Screenrecorder" "Recording starting in: $i" -p -r $NID)
        sleep 1
    done
    makoctl dismiss -a
}

chosen="$(screenrecorder)"

if [[ $chosen == "" ]]; then
    exit
fi

case "$chosen" in
    $option_1)
        geom="$(hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')"
        notify_delay
        wf-recorder -g "$geom" --file=$dir/$file
        wait
        notify
        ;;
    $option_2)
        geom=$(slurp)
        notify_delay
        wf-recorder -g "$geom" --file=$dir/$file
        wait
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
        notify_delay
        wf-recorder -g "$geom" --file=$dir/$file
        wait
        notify
        ;;
esac

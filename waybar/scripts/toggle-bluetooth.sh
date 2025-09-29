status=$(bluetoothctl show | rg "Powered:")

if [[ $status == *"Powered: yes"* ]]; then
    bluetoothctl power off > /dev/null
else
    bluetoothctl power on > /dev/null
fi

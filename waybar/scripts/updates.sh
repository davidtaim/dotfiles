aur=$(paru -Qum 2> /dev/null | wc -l)
arch=$(checkupdates 2> /dev/null | wc -l )

echo "󰣇 $aur | 󰮯 $arch";

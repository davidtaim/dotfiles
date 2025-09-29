wf=$(pgrep -fa wf-recorder 2> /dev/null | wc -l)

if [[ $wf > 0 ]]; then
    echo "Recording "
else
    echo ""
fi

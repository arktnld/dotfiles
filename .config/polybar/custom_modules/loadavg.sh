#!/bin/bash
LOAD=$(cat /proc/loadavg | awk '{print $1}')
CORES=$(nproc)
LOAD_PERCENT=$(echo "scale=0; $LOAD * 100 / $CORES" | bc)

if [ $LOAD_PERCENT -gt 80 ]; then
    echo "%{F#BF616A}󰓅 ${LOAD_PERCENT}%%{F-}"
elif [ $LOAD_PERCENT -gt 50 ]; then
    echo "%{F#EBCB8B}󰓅 ${LOAD_PERCENT}%%{F-}"
else
    echo ""
fi

#!/bin/bash
TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
TEMP=$((TEMP / 1000))

if [ $TEMP -gt 80 ]; then
    echo "%{F#BF616A}󰸁 ${TEMP}°C%{F-}"
elif [ $TEMP -gt 70 ]; then
    echo "%{F#EBCB8B}󱃂 ${TEMP}°C%{F-}"
else
    echo ""
fi

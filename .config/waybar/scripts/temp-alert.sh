#!/bin/bash
TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
TEMP=$((TEMP / 1000))

if [ $TEMP -gt 80 ]; then
    echo "{\"text\": \"󰸁  ${TEMP}°C\", \"class\": \"critical\"}"
elif [ $TEMP -gt 70 ]; then
    echo "{\"text\": \"󱃂  ${TEMP}°C\", \"class\": \"warning\"}"
else
    echo "{\"text\": \"\"}"
fi

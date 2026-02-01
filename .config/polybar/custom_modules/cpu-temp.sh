#!/bin/bash
# ~/.config/polybar/custom_modules/cpu-temp.sh

# Encontrar sensor correto
TEMP=$(sensors | grep 'Package id 0:' | awk '{print $4}' | tr -d '+°C')

if [ -z "$TEMP" ]; then
    TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
    TEMP=$(echo "scale=1; $TEMP / 1000" | bc)
fi

TEMP_INT=${TEMP%.*}

if [ $TEMP_INT -gt 75 ]; then
    ICON="󰸁"
    COLOR="%{F#BF616A}"
elif [ $TEMP_INT -gt 60 ]; then
    ICON="󱃂"
    COLOR="%{F#EBCB8B}"
else
    ICON="󱃃"
    COLOR="%{F#A3BE8C}"
fi

echo "${COLOR}${ICON} ${TEMP}°C%{F-}"

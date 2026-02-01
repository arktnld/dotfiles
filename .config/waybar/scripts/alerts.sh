#!/bin/bash

OUTPUT=""
CLASS="warning"

# CPU
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')
if [ $CPU -gt 80 ]; then
    OUTPUT+="󰘚 ${CPU}%  "
    CLASS="critical"
elif [ $CPU -gt 60 ]; then
    OUTPUT+="󰘚 ${CPU}%  "
fi

# Memory
MEM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
if [ $MEM -gt 90 ]; then
    OUTPUT+="󰍛 ${MEM}%  "
    CLASS="critical"
elif [ $MEM -gt 75 ]; then
    OUTPUT+="󰍛 ${MEM}%  "
fi

# Temperature
TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
TEMP=$((TEMP / 1000))
if [ $TEMP -gt 80 ]; then
    OUTPUT+="󰸁 ${TEMP}°C  "
    CLASS="critical"
elif [ $TEMP -gt 70 ]; then
    OUTPUT+="󱃂 ${TEMP}°C  "
fi

# Disk
DISK=$(df / | awk 'NR==2 {print int($5)}')
if [ $DISK -gt 90 ]; then
    OUTPUT+="󰋊 ${DISK}%  "
    CLASS="critical"
elif [ $DISK -gt 80 ]; then
    OUTPUT+="󰋊 ${DISK}%  "
fi

# Trim trailing spaces
OUTPUT=$(echo "$OUTPUT" | sed 's/  $//')

if [ -n "$OUTPUT" ]; then
    echo "{\"text\": \"$OUTPUT\", \"class\": \"$CLASS\"}"
else
    echo "{\"text\": \"\"}"
fi

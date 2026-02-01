#!/bin/bash
MEM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

if [ $MEM -gt 90 ]; then
    echo "%{F#BF616A}󰍛 ${MEM}%%{F-}"
elif [ $MEM -gt 75 ]; then
    echo "%{F#EBCB8B}󰍛 ${MEM}%%{F-}"
else
    echo ""
fi

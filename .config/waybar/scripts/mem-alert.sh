#!/bin/bash
MEM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

if [ $MEM -gt 90 ]; then
    echo "{\"text\": \"󰍛  ${MEM}%\", \"class\": \"critical\"}"
elif [ $MEM -gt 75 ]; then
    echo "{\"text\": \"󰍛  ${MEM}%\", \"class\": \"warning\"}"
else
    echo "{\"text\": \"\"}"
fi

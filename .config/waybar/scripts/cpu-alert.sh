#!/bin/bash
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')

if [ $CPU -gt 80 ]; then
    echo "{\"text\": \"󰘚  ${CPU}%\", \"class\": \"critical\"}"
elif [ $CPU -gt 60 ]; then
    echo "{\"text\": \"󰘚  ${CPU}%\", \"class\": \"warning\"}"
else
    echo "{\"text\": \"\"}"
fi

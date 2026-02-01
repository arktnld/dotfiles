#!/bin/bash
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')

if [ $CPU -gt 80 ]; then
    echo "%{F#BF616A}󰘚 ${CPU}%%{F-}"
elif [ $CPU -gt 60 ]; then
    echo "%{F#EBCB8B}󰘚 ${CPU}%%{F-}"
else
    echo ""
fi

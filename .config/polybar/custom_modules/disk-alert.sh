#!/bin/bash
DISK=$(df / | awk 'NR==2 {print int($5)}')

if [ $DISK -gt 90 ]; then
    echo "%{F#BF616A}󰋊 ${DISK}%%{F-}"
elif [ $DISK -gt 80 ]; then
    echo "%{F#EBCB8B}󰋊 ${DISK}%%{F-}"
else
    echo ""
fi

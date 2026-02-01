#!/bin/bash
DISK=$(df / | awk 'NR==2 {print int($5)}')

if [ $DISK -gt 90 ]; then
    echo "{\"text\": \"󰋊  ${DISK}%\", \"class\": \"critical\"}"
elif [ $DISK -gt 80 ]; then
    echo "{\"text\": \"󰋊  ${DISK}%\", \"class\": \"warning\"}"
else
    echo "{\"text\": \"\"}"
fi

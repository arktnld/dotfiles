#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar top 2>&1 | tee -a /tmp/polybar-top.log & disown
polybar bottom 2>&1 | tee -a /tmp/polybar-bottom.log & disown

#!/usr/bin/env bash

MonitorCount=$(xrandr --listactivemonitors | grep Monitors | awk -F ":" '{print $2}')

if [ $MonitorCount -gt 1 ]
then 
   sleep 2
   xrandr --output eDP-1 --off  --output DP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1-3 --mode 1920x1080 --pos 3840x0 --rotate normal
   nitrogen --restore >& /dev/null
else
   nitrogen --restore >& /dev/null

fi

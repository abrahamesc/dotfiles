#!/usr/bin/env bash

CurrentMonitors=1

while true; do
MonitorCount=$(xrandr | grep " connected " | awk '{print $1}' | wc -l)


if [ $MonitorCount != $CurrentMonitors ] && [ $MonitorCount -gt 1 ]
then
   xrandr --output eDP-1 --off  --output DP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1-3 --mode 1920x1080 --pos 3840x0 --rotate normal
   nitrogen --restore >& /dev/null
   CurrentMonitors=$MonitorCount
else
   nitrogen --restore >& /dev/null

fi
sleep 5
done

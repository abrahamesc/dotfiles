#!/bin/bash

pactl set-sink-volume $(pactl list short sinks | grep RUNNING | cut -f2) +10%

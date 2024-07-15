#!/bin/bash

pactl set-sink-mute $(pactl list short sinks | grep RUNNING | cut -f2)

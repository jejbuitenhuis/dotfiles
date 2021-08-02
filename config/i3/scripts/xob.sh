#!/bin/bash

VISIBLE_MS=1500
XOB="xob -t $VISIBLE_MS -s mountain_fuji"

~/.config/xob/scripts/log_volume.py | eval "$XOB" >> /dev/null 2>&1 &
~/.config/xob/scripts/log_backlight.py | eval "$XOB -m \$(cat /sys/class/backlight/intel_backlight/max_brightness)" >> /dev/null 2>&1 &


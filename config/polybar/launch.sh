#!/usr/bin/env bash

killall -q polybar

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	all_bars="top"

	IFS="," read -r -a bars <<< "$all_bars"

	for i in "${!bars[@]}"; do
		MONITOR=$m polybar -c "$HOME/.config/polybar/config.ini" "${bars[i]}" &
	done
done

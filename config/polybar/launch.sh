#!/usr/bin/env bash

killall -q polybar

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	[[ $m = "eDP-1" ]] && {
		all_bars="top"
	} || {
		all_bars="top_alt"
	}

	IFS="," read -r -a bars <<< "$all_bars"

	for i in "${!bars[@]}"; do
		MONITOR=$m polybar -c "$HOME/.config/polybar/config.ini" "${bars[i]}" &
	done
done

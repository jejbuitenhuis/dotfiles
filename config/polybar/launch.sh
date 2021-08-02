#!/usr/bin/env bash

configFile="$HOME/.config/polybar/config_$1"

[[ -z $1 || ! -f $configFile ]] && {
	echo "Config file \"$configFile\" doesn't exist"
	exit 1
}

killall -q polybar

echo "---" | tee -a /tmp/polybar_*.log

# polybar -c ~/.config/polybar/config top >>/tmp/polybar_top.log 2>&1 &
# polybar -c ~/.config/polybar/config bottom >>/tmp/polybar_bottom.log 2>&1 &

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	# moutain_fuji
	# [[ $m = "eDP-1" ]] && {
		# dpi=192
		# all_bars="top,bottom"
	# } || {
		# dpi=96
		# all_bars="bottom_alt"
	# }

	# sunrise_through_trees
	[[ $m = "eDP-1" ]] && {
		dpi=192
		all_bars="top"
	} || {
		dpi=96
		all_bars="top_alt"
	}

	# orange_moon_above_mountain
	# [[ $m = "eDP-1" ]] && {
		# dpi=192
		# all_bars="top"
	# } || {
		# dpi=96
		# all_bars="top_alt"
	# }

	IFS="," read -r -a bars <<< "$all_bars"
	for i in "${!bars[@]}"; do
		MONITOR=$m DPI=$dpi polybar -c $configFile "${bars[i]}" >> "/tmp/polybar_${m}_${bars[i]}.log" 2>&1 &
	done
done


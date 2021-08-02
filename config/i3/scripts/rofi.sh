#!/bin/bash

if [ -z "$1" ]; then
	echo No modes for rofi given;
	echo "";
	echo Format:;
	echo rofi.sh \"mode1,mode2,...\";
	echo \(for i3 you can use \# in stead of ,\);
	exit 1;
fi

modes=$1
dpi=$($HOME/scripts/get_dpi)
# current_layout=$(cat ~/.cache/xkb-curr-"$DISPLAY" || echo "")

# if [[ $current_layout == "NORMAL" ]]; then
	# ~/scripts/keyboard_mode_swapper "INSERT"
# fi

# echo $dpi $modes
rofi -dpi $dpi \
	-modi "$modes" \
	-show "$(echo $modes | sed 's/[\,\#].*//')"

# if [[ $current_layout == "NORMAL" ]]; then
	# ~/scripts/keyboard_mode_swapper "NORMAL"
# fi

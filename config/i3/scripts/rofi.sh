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

rofi -modi "$modes" \
	-show "$(echo $modes | sed 's/[\,\#].*//')"


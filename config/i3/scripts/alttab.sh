#!/bin/bash

killall alttab

alttab \
	-w 1 \
	-d 2 \
	-t 256x192 \
	-i 64x64 \
	-s 2 \
	-bg "#4c4e73" \
	-fg "#ffffff" \
	-frame "#d9b89c" \
	-font "xft:UbuntuMono-12"


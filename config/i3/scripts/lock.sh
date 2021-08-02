#!/bin/bash

background="#0d0d0d"
background_dark="#000000"
foreground="#d9d9d9"
primary="#f280df"
error="#f97e78"

i3lock --color="$background" \
	--ignore-empty-password \
	--show-failed-attempts \
	--clock \
	--pass-media-keys \
	--pass-screen-keys \
	--pass-volume-keys \
	--insidecolor="$background" \
	--ringcolor="$background_dark" \
	--insidevercolor="$background_dark" \
	--ringvercolor="$background_dark" \
	--verifcolor="$foreground" \
	--insidewrongcolor="$error" \
	--ringwrongcolor="$error" \
	--wrongcolor="$foreground" \
	--line-uses-inside \
	--keyhlcolor="$primary" \
	--bshlcolor="$error" \
	--separatorcolor="$primary" \
	--timecolor="$foreground" \
	--datecolor="$foreground" \
	--timestr="%H:%M" \
	--indpos="x + w / 2:y + h / 2" &

(while pidof i3lock; do
	if (fprintd-verify | grep "verify-match"); then
		killall -u $(whoami) i3lock
	fi
done) &


#!/bin/bash

cd ~/.mozilla/firefox/

folders=(*)

for i in "${!folders[@]}"
do
	if [ ! -d "${folders[$i]}" ]
	then
		unset 'folders[i]'
	fi

	if [[ ! "${folders[$i]}" =~ ^.+\..+$ ]]
	then
		unset 'folders[i]'
	fi
done

rofi_text=""

for folder in "${folders[@]}"
do
	rofi_text+="$(echo $folder | cut -d'.' -f 2)\n"
done

selected=$(echo -e $rofi_text | rofi -dmenu -i -select "default-release")


if [[ -z "$selected" ]]
then
	exit 0
fi

firefox --no-remote -P "$selected"

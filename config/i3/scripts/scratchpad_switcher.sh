#!/bin/bash

windows_plain=$(i3-msg -t get_tree | jq -c '.nodes[] | select( .name == "__i3" ) | .nodes[] | select( .nodes[]  | select( .name == "__i3_scratch" ) ).nodes[] | select( .name == "__i3_scratch" ) | .nodes += .floating_nodes | .nodes | map( .nodes | map( { id: .id, name: .name } ) ) | flatten[]')
IFS=$'\n' read -rd '' -a windows <<< "$windows_plain"
rofi_text=""

for window in "${windows[@]}"
do
	rofi_text+="$(echo $window | jq -r '.name')\n"
done

selected=$(echo -e $rofi_text | rofi -dmenu -i)

echo $windows_plain

if [[ ! -z "$selected" ]]
then
	con_id=$(echo $windows_plain | jq -s -c ".[] | select( .name == \"$selected\" ).id")

	i3-msg "[con_id=$con_id] scratchpad show"
fi

#!/bin/bash

OUTPUT=$(i3-msg -t get_workspaces)
LENGTH=$(echo $OUTPUT | jq "length")

function get_active_window {
    for (( i=0; i < $LENGTH; i++ ))
    do
        local CURRENT=$(echo $OUTPUT | jq ".[$i]")
        local VISIBLE=$(echo $CURRENT | jq ".visible")
        local FOCUSED=$(echo $CURRENT | jq ".focused")

        if [ "$VISIBLE" = "true" ] && [ "$FOCUSED" = "true" ]
        then
            echo $CURRENT | jq ".output"
        fi
    done
}

RESULT=$(get_active_window $OUTPUT)
echo $RESULT


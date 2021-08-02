#!/usr/bin/env bash

LANG=C pactl subscribe | grep "Event 'change' on server" --line-buffered | while read p; do
    GLAVA=$(pactl list short clients | grep glava | cut -f 1);
    FROM=$(pactl list source-outputs short | grep $GLAVA | cut -f 1);
    echo $FROM;
    pactl move-source-output $FROM @DEFAULT_MONITOR@;
done


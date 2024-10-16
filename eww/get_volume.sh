#!/bin/bash
pactl get-sink-volume @DEFAULT_SINK@ | rg -e '(\d+)%' -o | head -n 1 | rg -e '\d+' -o

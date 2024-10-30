#!/bin/bash
pulsemixer --list | rg spotify | rg 'ID: ([\w-]+)' -or '$1' | xargs -I % pulsemixer --id % --get-volume | awk '{print $1;}'

#!/bin/bash
pulsemixer --list | rg spotify | rg 'ID: ([\w-]+)' -or '$1' | xargs -I % pulsemixer --id % --set-volume $1

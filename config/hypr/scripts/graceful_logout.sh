#!/bin/bash

# List of applications to close gracefully
apps_to_close=("brave" "discord" "kitty")

for app in "${apps_to_close[@]}"; do
    pkill -TERM "$app"
done

# Wait for applications to close
sleep 5

# Exit Hyprland
hyprctl dispatch exit


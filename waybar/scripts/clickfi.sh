#!/bin/bash

# Define Wofi's launch command with desired position and hide-on-select flags
# Adjust --x and --y values as needed to position Wofi
WOFI_CMD="wofi --show drun --insensitive -x 0 -y 85"

# Check if Wofi is already running
if pgrep -x "wofi" > /dev/null; then
    # If Wofi is running, kill it
    pkill -x "wofi"
else
    # If Wofi is not running, launch it in the background
    # The 'exec' here ensures the script itself is replaced by wofi,
    # which can sometimes help with process management.
    # We detach it from the shell so Waybar doesn't wait for it.
    exec $WOFI_CMD &
fi


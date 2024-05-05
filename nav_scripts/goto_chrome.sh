#!/bin/bash

# Raycast Script Command Template
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Go to Chrome
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

# focus (C)hrome
chrome_index="$(yabai -m query --windows | jq 'map(select(.app == "Google Chrome")) | sort_by(.title | contains("MAIN WINDOW")).[-1].id')"
yabai -m window --focus "${chrome_index}"

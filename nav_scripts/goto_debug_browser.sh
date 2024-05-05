#!/bin/bash

# Raycast Script Command Template
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Go to Debug Chrome
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

# focus (D)ebug Chrome instance
chrome_index="$(yabai -m query --windows | jq 'map(select(.app == "Google Chrome")) | sort_by(.title | contains("DEBUG")).[-1].id')"
yabai -m window --focus "${chrome_index}"

#!/bin/bash

# Raycast Script Command Template
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Go to dev terminal
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

# Focus VS Code after moving to desktop 8
nvim_index="$(yabai -m query --windows | jq 'map(select(.app == "iTerm2")) | sort_by(.title | contains("DEV WINDOW"))[-1].id')"
yabai -m window --focus "${nvim_index}"

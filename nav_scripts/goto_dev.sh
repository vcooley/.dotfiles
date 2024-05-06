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

dev_window_id="$(yabai -m query --windows | jq 'sort_by(.title | contains("DEV WINDOW"))[-1].id')"
yabai -m window --focus "${dev_window_id}"

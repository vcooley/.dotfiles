#!/bin/bash

# Raycast Script Command Template
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Go to Dashbord Editor
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

# Focus VS Code, preferring Tesorio Dashboard repo
code_index="$(yabai -m query --windows | jq 'map(select(.app == "Code")) | sort_by(.title | contains("Dashboard") | not).[0].id')"
yabai -m window --focus "${code_index}"

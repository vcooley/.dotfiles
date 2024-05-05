#!/bin/bash

# Raycast Script Command Template
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Go to Google Meet
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

# meet window should be in "MAIN WINDOW" chrome instance
./goto_chrome.sh
sleep 0.2
# chrome shortcut to focus the 3rd tab, Google Meet \
skhd -k "cmd - 3"

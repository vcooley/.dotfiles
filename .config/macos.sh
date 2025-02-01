#!/bin/bash

# Some users mention the key repeat setting may get clobbered during updates or when modifying other Keyboard settings
defaults write -g InitialKeyRepeat -int 13 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# show/hide dock instantly
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

# Settings for better compatibility with Aerospace
defaults write com.apple.dock expose-group-apps -bool true && killall Dock
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

# Disable animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Disable press and hold for accented characters, which inhibits holding a key for navigation in vim
defaults write -g ApplePressAndHoldEnabled -bool false


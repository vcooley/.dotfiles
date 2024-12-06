# Some users mention the key repeat setting may get clobbered during updates or when modifying other Keyboard settings
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

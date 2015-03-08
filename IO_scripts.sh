# 0 is fastest and 3 is slowest
defaults write NSGlobalDomain KeyRepeat -int 1
# disable apsd (Apple Push Notification Servide)
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.apsd.plist
# reenable it with:
# sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.apsd.plist w

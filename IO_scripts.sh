# Make sure zsh is in /etc/shells
echo $(which zsh) >> /etc/shells
# Change shell to chsh
chsh -s $(which zsh)
# 0 is fastest and 3 is slowest
defaults write NSGlobalDomain KeyRepeat -int 1
# disable apsd (Apple Push Notification Servide)
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.apsd.plist
# reenable it with:
# sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.apsd.plist w

# Set Inconsolata-dz for Powerline in iTerm for bot ASCII and non-ASCII chars

# Avoid swipe navigate with scrolls in chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

# Repeat letters when holding down
defaults write -g ApplePressAndHoldEnabled -bool false

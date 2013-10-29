#!/bin/sh

# Set my defaults in OS X

# Show hidden apps with transperency
defaults write com.apple.dock showhidden -bool true
# Do not reopen windows
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
# Enable font smoothing on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2 
# Disable menu bar transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false 
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02
# Hide iDisk in finder
defaults write com.apple.finder RemoveIDiskFromSidebarOnStartup -bool true
# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2 
# Add invitations to iCal
defaults write com.apple.mail AddInvitationsToICalAutomatically -bool true
# Mark all conversation messages as read when opening a conversation
defaults write com.apple.mail ConversationViewMarkAllAsRead -bool true
# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true 
# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean true
# Show the ~/Library folder
chflags nohidden ~/Library 
# Avoid creating .DS_Store files on network volumes
#defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Enable key repeat
defaults write -g ApplePressAndHoldEnabled -bool false
# Save screenshots in ~/Pictures
defaults write com.apple.screencapture location ~/Pictures

for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

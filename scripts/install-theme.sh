#!/bin/bash
#
# Author  : Steve Michael
# Date    : 05 April 2025
# Purpose : Install Breeze Theme for better look
set -e

# Variables for theme names
GTK_THEME="Breeze_Noir_Dark_GTK"
SHELL_THEME="YourShellThemeName"

# Install git
sudo apt install git

# Clone and run the Install GNOME Themes script
if [ ! -d "$HOME/install-gnome-themes" ]; then
    git clone https://github.com/tliron/install-gnome-themes ~/install-gnome-themes
fi

~/install-gnome-themes/install-gnome-themes

git clone https://github.com/L4ki/Breeze-Noir-Dark-GTK.git

# Activate themes using gsettings
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
gsettings set org.gnome.desktop.wm.preferences theme "$SHELL_THEME"

# Optional: Restart GNOME Shell for immediate effect
echo "Restarting GNOME Shell..."
DISPLAY=:0 gnome-shell --replace &

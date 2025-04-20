#!/bin/bash

# Script to install wallpaper and logo in Linux Mint

# Variables
WALLPAPER_PATH="/usr/share/backgrounds/MWM-logo.png"
USER_HOME=$(eval echo ~${SUDO_USER})

# Function to copy wallpaper
install_wallpaper() {
    echo "Installing wallpaper..."
    if [ -f "MWM-logo.png" ]; then
        sudo cp MWM-logo.png "$WALLPAPER_PATH"
        echo "Installing desktop wallpaper"
            cp ../logos/MWM-logo.png /usr/share/backgrounds/
            cp ../logos/MWM-logo.png /usr/share/backgrounds/warty-final-cinnamom.png
        gsettings set org.cinnamon.desktop.background picture-uri "file://$WALLPAPER_PATH"
        echo "Wallpaper installed successfully."
    else
        echo "Error: MWM-logo.png not found in the current directory."
        exit 1
    fi
}

# Main script execution
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

install_wallpaper

echo "Branding installation completed."

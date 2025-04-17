#!/bin/bash

# Script to install wallpaper and logo in Linux Mint

# Variables
WALLPAPER_PATH="/usr/share/backgrounds/MWM-wallpaper.png"
LOGO_PATH="/usr/share/icons/MWM-logo.png"
USER_HOME=$(eval echo ~${SUDO_USER})

# Function to copy wallpaper
install_wallpaper() {
    echo "Installing wallpaper..."
    if [ -f "custom-wallpaper.png" ]; then
        sudo cp custom_wallpaper.png "$WALLPAPER_PATH"
        gsettings set org.cinnamon.desktop.background picture-uri "file://$WALLPAPER_PATH"
        echo "Wallpaper installed successfully."
    else
        echo "Error: custom_wallpaper.png not found in the current directory."
        exit 1
    fi
}

# Function to copy logo
install_logo() {
    echo "Installing logo..."
    if [ -f "custom_logo.png" ]; then
        sudo cp custom_logo.png "$LOGO_PATH"
        echo "Logo installed successfully."
    else
        echo "Error: custom_logo.png not found in the current directory."
        exit 1
    fi
}

# Main script execution
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

install_wallpaper
install_logo

echo "Branding installation completed."
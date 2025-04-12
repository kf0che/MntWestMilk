#!/bin/bash

# Exit on any error
set -e

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Update system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Check if KDE Plasma and system settings is installed
if ! command -v plasma-desktop &> /dev/null; then
    echo "KDE Plasma is not installed. Installing KDE Plasma Desktop."
    sudo apt install -y kde-plasma-desktop systemsettings
fi

# Check if GTK2 is installed
if ! command -v gtk2 &> /dev/null; then
    echo "GTK2 is not installed. Installing GTK theme dependencies..."
    sudo apt install -y gtk2-engines-murrine gtk2-engines-pixbuf
    exit 1
fi

# Check if GTK2.0 is installed
if ! command -v gtk2.0 &> /dev/null; then
    echo "GTK2.0 is not installed. Installing GTK2.0 theme dependencies..."
    sudo apt install -y gtk2-engines-murrine gtk2-engines-pixbuf
    exit 1
fi

# Check if GTK3.0 is installed
if ! command -v gtk3.0 &> /dev/null; then
    echo "GTK3.0 is not installed. Installing GTK3.0 theme dependencies..."
    sudo apt install -y gtk3-engines-murrine gtk3-engines-pixbuf
    exit 1
fi
# Check if GTK4.0 is installed
if ! command -v gtk4.0 &> /dev/null; then
    echo "GTK4.0 is not installed. Installing GTK4.0 theme dependencies..."
    sudo apt install -y gtk4-engines-murrine gtk4-engines-pixbuf
else
    echo "GTK4.0 is already installed."
fi
# Check if GTK5 is installed
if ! command -v gtk5 &> /dev/null; then
    echo "GTK5 is not installed. Installing GTK5 theme dependencies..."
    sudo apt install -y gtk5-engines-murrine gtk5-engines-pixbuf
else
    echo "GTK5 is already installed."
fi

# Check if GTK6 is installed
if ! command -v gtk6 &> /dev/null; then
    echo "GTK6 is not installed. Installing GTK6 theme dependencies..."
    sudo apt install -y gtk6-engines-murrine gtk6-engines-pixbuf
else
    echo "GTK6 is already installed."
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "git is not installed. Please install it first."
    exit 1
fi

# Check if apt is installed
if ! command -v apt &> /dev/null; then
    echo "apt is not installed. Please install it first."
    exit 1
fi

# Check if wget is installed
if ! command -v wget &> /dev/null; then
    echo "wget is not installed. Installing wget."
    sudo apt install -y wget
fi

# Make sure the themes directory exists
if [ ! -d ~/.themes ]; then
    echo "Creating themes directory..."
    mkdir -p ~/.themes
fi

# Clone the Breeze-Noir-Dark-GTK theme repository
echo "Cloning Breeze-Noir-Dark-GTK theme..."
git clone https://github.com/L4ki/Breeze-Noir-Dark-GTK.git /tmp/Breeze-Noir-Dark-GTK

# Check if the clone was successful
if [ ! -d /tmp/Breeze-Noir-Dark-GTK ]; then
    echo "Failed to clone the repository. Please check your internet connection."
    exit 1
fi

# Install the theme
echo "Installing theme..."
cp -r /tmp/Breeze-Noir-Dark-GTK/Breeze-Noir-Dark-GTK ~/.themes/

# Check if the installation was successful
if [ ! -d ~/.themes/Breeze-Noir-Dark-GTK ]; then
    echo "Failed to install the theme. Please check the installation."
    exit 1
fi

# Clean up
echo "Cleaning up..."
rm -rf /tmp/Breeze-Noir-Dark-GTK

echo "Installation complete!"
echo "You can now switch to Breeze-Noir-Dark-GTK using System Settings > Appearance > Application Style > Configure GTK Themes."
echo "Please restart your session or reboot your system to apply the changes."

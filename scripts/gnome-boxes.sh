#!/bin/bash

# Update package lists
sudo apt update

# Install Flatpak if not already installed
sudo apt install -y flatpak

# Add the Flathub repository if not already added
if ! flatpak remotes | grep -q flathub; then
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# Install GNOME Boxes from Flathub
sudo flatpak install -y flathub org.gnome.Boxes

# Confirm installation
echo "GNOME Boxes has been installed successfully."
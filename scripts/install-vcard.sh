#!/bin/bash

# Script to install VCard Studio by Chronos via Flatpak on Linux Mint

# Ensure Flatpak is installed
echo "Ensuring Flatpak is installed..."
sudo apt update
sudo apt install -y flatpak

# Add Flathub repository if not already added
echo "Adding Flathub repository..."
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install VCard Studio by Chronos from Flathub
echo "Installing VCard Studio by Chronos..."
flatpak install -y flathub com.chronos.VCardStudio

echo "Installation complete. You can launch VCard Studio by Chronos from your application menu."

https://dl.flathub.org/repo/appstream/net.zdechov.app.vCardStudio.flatpakref
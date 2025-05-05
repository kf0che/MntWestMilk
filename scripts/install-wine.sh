#!/bin/bash

# Script to install Wine and Winetricks on Linux Mint

# Update package list and install prerequisites
sudo apt update
sudo apt install -y software-properties-common wget

# Add WineHQ repository
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"

# Update package list and install Wine
sudo apt update
sudo apt install -y --install-recommends winehq-stable

# Verify Wine installation
wine --version

# Install Winetricks
sudo apt install -y winetricks

# Verify Winetricks installation
winetricks --version

echo "Wine and Winetricks installation completed successfully."
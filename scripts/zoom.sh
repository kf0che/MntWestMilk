#!/bin/bash

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y wget gdebi-core

# Download the latest Zoom .deb package
wget https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom_amd64.deb

# Install Zoom
sudo gdebi -n /tmp/zoom_amd64.deb

# Clean up
rm /tmp/zoom_amd64.deb

echo "Zoom installation completed."
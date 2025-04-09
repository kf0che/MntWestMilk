#!/bin/bash

# Update package list and install prerequisites
sudo apt update
sudo apt install -y wget gnupg2

# Add AnyDesk GPG key
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -

# Add AnyDesk repository
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk.list

# Update package list again
sudo apt update

# Install AnyDesk
sudo apt install -y anydesk

# Confirm installation
echo "AnyDesk installation completed."
anydesk --version

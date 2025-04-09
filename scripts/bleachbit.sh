#!/bin/bash

# Update package lists
sudo apt update

# Install BleachBit
sudo apt install -y bleachbit

# Confirm installation
if command -v bleachbit &> /dev/null; then
    echo "BleachBit installed successfully."
else
    echo "Failed to install BleachBit."
fi
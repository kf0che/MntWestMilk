#!/bin/bash

# Script to install PlayOnLinux on Linux Mint

# Update package list
sudo apt update

# Install required dependencies
sudo apt install -y software-properties-common

# Add PlayOnLinux repository
sudo add-apt-repository -y ppa:phoerious/ppa

# Update package list again
sudo apt update

# Install PlayOnLinux
sudo apt install -y playonlinux

# Confirm installation
echo "PlayOnLinux installation completed."
playonlinux --version
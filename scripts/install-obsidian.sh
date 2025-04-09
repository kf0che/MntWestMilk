#!/bin/bash

# Script to install Obsidian on Linux Mint

# Define variables
OBSIDIAN_VERSION="1.4.13" # Replace with the latest version if needed
DOWNLOAD_URL="https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/Obsidian-${OBSIDIAN_VERSION}.AppImage"
INSTALL_DIR="/usr/local/bin"
DESKTOP_FILE="/usr/share/applications/obsidian.desktop"

# Download Obsidian AppImage
echo "Downloading Obsidian version ${OBSIDIAN_VERSION}..."
wget -q --show-progress -O Obsidian.AppImage "${DOWNLOAD_URL}"

# Make the AppImage executable
chmod +x Obsidian.AppImage

# Move the AppImage to the installation directory
echo "Installing Obsidian to ${INSTALL_DIR}..."
sudo mv Obsidian.AppImage "${INSTALL_DIR}/obsidian"

# Create a desktop entry for Obsidian
echo "Creating desktop entry..."
sudo bash -c "cat > ${DESKTOP_FILE}" <<EOL
[Desktop Entry]
Name=Obsidian
Comment=Obsidian Note-Taking App
Exec=${INSTALL_DIR}/obsidian
Icon=obsidian
Terminal=false
Type=Application
Categories=Office;Utility;
EOL

# Notify the user
echo "Obsidian installation complete. You can now launch it from your application menu."
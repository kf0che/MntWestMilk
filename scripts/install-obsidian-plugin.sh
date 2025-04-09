#!/bin/bash

# Script to install Obsidian plugins on Linux Mint

# Variables
OBSIDIAN_DIR="$HOME/.config/obsidian"
PLUGIN_DIR="$OBSIDIAN_DIR/plugins"
PLUGIN_REPO_URL="https://github.com/<plugin-author>/<plugin-repo>.git" # Replace with actual plugin repo URL
PLUGIN_NAME="<plugin-name>" # Replace with actual plugin name

# Ensure Obsidian directory exists
if [ ! -d "$OBSIDIAN_DIR" ]; then
    echo "Obsidian directory not found. Please install and set up Obsidian first."
    exit 1
fi

# Ensure plugins directory exists
mkdir -p "$PLUGIN_DIR"

# Clone the plugin repository
echo "Installing $PLUGIN_NAME plugin..."
git clone "$PLUGIN_REPO_URL" "$PLUGIN_DIR/$PLUGIN_NAME"

if [ $? -eq 0 ]; then
    echo "$PLUGIN_NAME plugin installed successfully."
else
    echo "Failed to install $PLUGIN_NAME plugin."
    exit 1
fi
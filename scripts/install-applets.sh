#!/bin/bash

# Set the directory where Cinnamon applets are stored
APPLET_DIR="$HOME/.local/share/cinnamon/applets"

# Ensure the directory exists
mkdir -p "$APPLET_DIR"
cd "$APPLET_DIR" || exit

# Function to install an applet
install_applet() {
    local repo_url=$1
    local folder_name=$2

    echo "Installing $folder_name..."
    if [ -d "$folder_name" ]; then
        echo "$folder_name already exists. Skipping..."
    else
        git clone "$repo_url" "$folder_name"
    fi
}

# Applet Repositories
install_applet "https://github.com/linuxmint/cinnamon-spices-applets.git" "temp-cinnamon-applets"

# Copy specific applets from the cloned repo
cd "temp-cinnamon-applets" || exit

declare -a applets_to_install=(
    "google-search-box@jacob"
    "calculator@scollins"
    "screenshot@tech71"
    "workspace-switcher-enhanced@cinnamon.org"
)

for applet in "${applets_to_install[@]}"; do
    if [ -d "$applet" ]; then
        cp -r "$applet" "$APPLET_DIR/"
        echo "$applet installed."
    else
        echo "Applet $applet not found in the repo!"
    fi
done

# Clean up
cd ..
rm -rf temp-cinnamon-applets

echo "Installation complete. Please go to System Settings > Applets to enable them."
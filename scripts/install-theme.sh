#!/bin/bash

set -e

# Variables for theme names
GTK_THEME="Breeze_Noir_Dark_GTK"
#SHELL_THEME="YourShellThemeName"

# Download Git
sudo apt install git

# Function to check if a theme exists
check_theme_exists() {
    local theme_path="/usr/share/themes/Breeze-Noir-Dark-GTK"
    if [ -d "$theme_path" ]; then
        return 0  # Theme exists
    else
        return 1  # Theme doesn't exist
    fi
}

# Clone and run the Install GNOME Themes script
if [ ! -d "$HOME/install-gnome-themes" ]; then
    git clone https://github.com/tliron/install-gnome-themes ~/install-gnome-themes
fi

~/install-gnome-themes/install-gnome-themes

git clone https://github.com/L4ki/Breeze-Noir-Dark-GTK.git

gtk_theme=Breeze-Noir-Dark-GTK

# Function to change themes
change_theme() {
    local gtk_theme="Breeze-Noir-Dark-GTK"
    local icon_theme="Breeze-Noir-Dark-GTK"
    local cursor_theme="Breeze-Noir-Dark-GTK"

    # Check if themes exist
    local gtk_theme_path="/usr/share/themes/$gtk_theme"
    local icon_theme_path="/usr/share/icons/$icon_theme"
    local cursor_theme_path="/usr/share/icons/$cursor_theme"

    # Change GTK theme if valid
    if check_theme_exists "$gtk_theme_path"; then
        gsettings set org.cinnamon.desktop.wm.preferences theme "$gtk_theme"
        gsettings set org.cinnamon.desktop.interface gtk-theme "$gtk_theme"
        echo "GTK Theme changed to $gtk_theme"
    else
        echo "GTK Theme $gtk_theme not found!"
    fi

    # Change Icon theme if valid
    if check_theme_exists "$icon_theme_path"; then
        gsettings set org.cinnamon.desktop.interface icon-theme "$icon_theme"
        echo "Icon Theme changed to $icon_theme"
    else
        echo "Icon Theme $icon_theme not found!"
    fi

    # Change Cursor theme if valid
    if check_theme_exists "$cursor_theme_path"; then
        gsettings set org.gnome.desktop.interface cursor-theme "$cursor_theme"
        echo "Cursor Theme changed to $cursor_theme"
    else
        echo "Cursor Theme $cursor_theme not found!"
    fi
}

# List of themes you want to use (adjust these to your preferred themes)
GTK_THEME="Breeze-Noir-Dark-GTK"    # Replace with your desired GTK theme
ICON_THEME="Papirus"       # Replace with your desired icon theme
CURSOR_THEME="Adwaita"     # Replace with your desired cursor theme (optional)

# Run the function to change the theme
change_theme "$GTK_THEME" "$ICON_THEME" "$CURSOR_THEME"

# Activate themes using gsettings
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
gsettings set org.gnome.desktop.wm.preferences theme "$SHELL_THEME"

# Optional: Restart GNOME Shell for immediate effect
echo "Restarting GNOME Shell..."
DISPLAY=:0 gnome-shell --replace &
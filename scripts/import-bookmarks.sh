#!/bin/bash

# Script to import bookmarks into Firefox on Linux Mint 22

# Variables
BOOKMARKS_FILE="/bookmarks.html"  # Path to your bookmarks HTML file (passed as argument)
FIREFOX_DIR="$HOME/.mozilla/firefox"  # Firefox profile directory
PROFILE_DIR=$(grep -E "Default=.*" "$FIREFOX_DIR/profiles.ini" | cut -d'=' -f2)  # Extract default profile
FULL_PROFILE_PATH="$FIREFOX_DIR/$PROFILE_DIR"

# Check if bookmarks file is provided
if [ -z "$BOOKMARKS_FILE" ]; then
    echo "Error: Please provide the path to the bookmarks HTML file."
    echo "Usage: $0 /path/to/bookmarks.html"
    exit 1
fi

# Verify the bookmarks file exists
if [ ! -f "$BOOKMARKS_FILE" ]; then
    echo "Error: Bookmarks file '$BOOKMARKS_FILE' not found."
    exit 1
fi

# Check if Firefox profile directory exists
if [ ! -d "$FULL_PROFILE_PATH" ]; then
    echo "Error: Firefox profile directory not found at '$FULL_PROFILE_PATH'."
    exit 1
fi

# Ensure Firefox is not running (to avoid database locks)
if pgrep firefox > /dev/null; then
    echo "Error: Firefox is currently running. Please close Firefox and try again."
    exit 1
fi

# Copy the bookmarks file to the profile directory
cp "$BOOKMARKS_FILE" "$FULL_PROFILE_PATH/bookmarks.html"
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy bookmarks file to Firefox profile directory."
    exit 1
fi

# Use Firefox to import the bookmarks
firefox --no-remote -P "$PROFILE_DIR" --headless <<EOF
    Components.utils.import("resource://gre/modules/BookmarkHTMLUtils.jsm");
    BookmarkHTMLUtils.importFromURL("file://$FULL_PROFILE_PATH/bookmarks.html", false);
    Services.startup.quit(Components.interfaces.nsIAppStartup.eForceQuit);
EOF

# Check if the import was successful
if [ $? -eq 0 ]; then
    echo "Bookmarks successfully imported into Firefox."
else
    echo "Error: Failed to import bookmarks."
    exit 1
fi

# Clean up (optional: remove the temporary bookmarks file)
rm -f "$FULL_PROFILE_PATH/bookmarks.html"

echo "Script completed."
exit 0
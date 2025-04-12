#!/bin/bash

# Path to Firefox profile directory (update this to match your profile)
FIREFOX_PROFILE_DIR="$HOME/.mozilla/firefox/*.default-release"

# Bookmark details
BOOKMARK_TITLE="Example Bookmark"
BOOKMARK_URL="https://www.example.com"

# Check if sqlite3 is installed
if ! command -v sqlite3 &> /dev/null; then
    echo "sqlite3 is not installed. Install it using your package manager."
    exit 1
fi

# Find the places.sqlite file
PLACES_DB=$(find $FIREFOX_PROFILE_DIR -name "places.sqlite" | head -n 1)

if [ -z "$PLACES_DB" ]; then
    echo "places.sqlite not found. Ensure Firefox is installed and a profile exists."
    exit 1
fi

# Add the bookmark
sqlite3 "$PLACES_DB" <<EOF
INSERT INTO moz_bookmarks (type, fk, parent, position, title, dateAdded, lastModified)
SELECT 1, id, (SELECT id FROM moz_bookmarks WHERE title = 'Bookmarks Menu'), 
       (SELECT MAX(position)+1 FROM moz_bookmarks WHERE parent = (SELECT id FROM moz_bookmarks WHERE title = 'Bookmarks Menu')), 
       '$BOOKMARK_TITLE', strftime('%s','now')*1000000, strftime('%s','now')*1000000
FROM moz_places WHERE url = '$BOOKMARK_URL';

INSERT OR IGNORE INTO moz_places (url, title, rev_host, visit_count, hidden, typed, frequency, last_visit_date)
VALUES ('$BOOKMARK_URL', '$BOOKMARK_TITLE', '', 0, 0, 0, 0, strftime('%s','now')*1000000);
EOF

echo "Bookmark added successfully!"
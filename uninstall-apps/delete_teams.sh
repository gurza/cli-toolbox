#!/usr/bin/env sh

# Path to Microsoft Teams classic app
TEAMS_APP_PATH="/Applications/Microsoft Teams classic.app"

if [ -d "$TEAMS_APP_PATH" ]; then
    echo "Deleting Microsoft Teams classic..."
    rm -rf "$TEAMS_APP_PATH"
    echo "Microsoft Teams classic has been deleted."
else
    echo "Microsoft Teams classic is not installed."
fi

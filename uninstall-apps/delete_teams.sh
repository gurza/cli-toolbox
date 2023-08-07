#!/usr/bin/env sh

# This script uninstalls Microsoft Teams classic and its related data from a Mac.

# Path to Microsoft Teams classic app
TEAMS_APP_PATH="/Applications/Microsoft Teams classic.app"

# Paths to Microsoft Teams related data and cache
TEAMS_DATA_PATHS=(
    "$HOME/Library/Caches/com.microsoft.teams"
    "$HOME/Library/Caches/com.microsoft.teams.shipit"
    "$HOME/Library/Application Support/Microsoft/Teams"
    "$HOME/Library/Application Support/Microsoft/Teams/Application Cache/Cache"
    "$HOME/Library/Application Support/Microsoft/Teams/blob_storage"
    "$HOME/Library/Application Support/Microsoft/Teams/Cache"
    "$HOME/Library/Application Support/Microsoft/Teams/databases"
    "$HOME/Library/Application Support/Microsoft/Teams/GPUCache"
    "$HOME/Library/Application Support/Microsoft/Teams/IndexedDB"
    "$HOME/Library/Application Support/Microsoft/Teams/Local Storage"
    "$HOME/Library/Application Support/Microsoft/Teams/tmp"
)

remove_item() {
    if [ -d "$1" ]; then
        echo "Deleting $1..."
        rm -rf "$1"
        echo "$1 has been deleted."
    else
        echo "$1 is not present."
    fi
}

remove_item "$TEAMS_APP_PATH"

for path in "${TEAMS_DATA_PATHS[@]}"; do
    remove_item "$path"
done

echo "Microsoft Teams classic and associated data have been removed, if they were present."

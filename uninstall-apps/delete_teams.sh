#!/usr/bin/env sh

# Path to Microsoft Teams classic app
TEAMS_APP_PATH="/Applications/Microsoft Teams classic.app"
# Paths to Microsoft Teams related data
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

delete_directory() {
    if [ -d "$1" ]; then
        echo "Deleting $1..."
        rm -rf "$1"
        echo "$1 has been deleted."
    else
        echo "$1 is not present."
    fi
}

if [ -d "$TEAMS_APP_PATH" ]; then
    echo "Deleting Microsoft Teams classic..."
    rm -rf "$TEAMS_APP_PATH"
    echo "Microsoft Teams classic has been deleted."
else
    echo "Microsoft Teams classic is not installed."
fi

# Delete Microsoft Teams related data
for path in "${TEAMS_DATA_PATHS[@]}"; do
    delete_directory "$path"
done

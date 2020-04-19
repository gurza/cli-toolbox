#!/usr/bin/env bash
#
# Uninstalling Xamarin on macOS.
#

current_userid=$(id -u)
if [ $current_userid -ne 0 ]; then
    echo "$(basename "$0") uninstallation script requires superuser privileges to run" >&2
    exit 1
fi

/Library/Frameworks/Xamarin.Interactive.framework/Versions/Current/uninstall

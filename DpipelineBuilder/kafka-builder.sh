#!/bin/bash
SERVER_FILE="servers.txt"
# Check if the server file exists
if [ ! -f "$SERVER_FILE" ]; then
    echo "Error: Server file not found!"
    exit 1
fi

# Loop through each server listed in the file and execute the update command
while read -r server; do
    if [ -z "$server" ]; then
        continue # skip empty lines
    fi
    echo "Updating files on $server..."
    ssh "$server" "$UPDATE_COMMAND"
done < "$SERVER_FILE"

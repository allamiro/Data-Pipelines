#!/bin/bash
SERVER_FILE="servers.txt"
# Check if the server file exists
if [ ! -f "$SERVER_FILE" ]; then
    echo "Error: Server file not found!"
    exit 1
fi

# Loop through each server listed in the file
while read -r server; do
    if [ -z "$server" ]; then
        continue # skip empty lines
    fi
    echo "Connecting to $server..."
    ssh "$server" <<- 'SSHCOMMANDS'
        echo "Appending text to a file..."
        echo "Sample text" >> /path/to/remote/file.txt
        echo "Listing directory contents..."
        ls -l /path/of/interest
        echo "Checking disk usage..."
        df -h
        echo "Updating system packages..."
        sudo apt-get update && sudo apt-get upgrade -y
SSHCOMMANDS
done < "$SERVER_FILE"

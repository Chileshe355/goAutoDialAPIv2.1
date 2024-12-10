#!/bin/bash

# Variables
TARGET_DIR="/var/www/html/goAPIv2"
TEMP_DIR="/tmp/goAPIv2.1"
REPO_URL="https://github.com/Chileshe355/goAutoDialAPIv2.1.git"

# Step 1: Remove the existing goAPIv2 directory
echo "Removing existing goAPIv2 directory..."
if [ -d "$TARGET_DIR" ]; then
    sudo rm -rf "$TARGET_DIR"
    echo "Removed existing directory: $TARGET_DIR"
else
    echo "No existing goAPIv2 directory found. Skipping removal."
fi

# Step 2: Clone the repository into a temporary directory
echo "Cloning repository from $REPO_URL..."
git clone "$REPO_URL" "$TEMP_DIR"
if [ $? -eq 0 ]; then
    echo "Repository cloned to $TEMP_DIR"
else
    echo "Failed to clone repository. Exiting."
    exit 1
fi

# Step 3: Move the cloned repository to the target directory
echo "Moving the cloned repository to $TARGET_DIR..."
sudo mv "$TEMP_DIR" "$TARGET_DIR"
echo "Replaced directory with the latest version from the repository."

# Step 4: Set permissions for the web server
echo "Setting permissions for $TARGET_DIR..."
sudo chmod -R 755 "$TARGET_DIR"
sudo chown -R apache:apache "$TARGET_DIR"
echo "Permissions set successfully."

# Step 5: Clean up temporary directory (optional, should already be moved)
echo "Cleaning up temporary directory..."
if [ -d "$TEMP_DIR" ]; then
    sudo rm -rf "$TEMP_DIR"
    echo "Temporary directory cleaned up."
fi

echo "Update process completed successfully!"

# #!/bin/bash

# # Variables
# BACKUP_DIR="/var/www/html/goAPIv2_backup"
# TARGET_DIR="/var/www/html/goAPIv2"
# TEMP_DIR="/tmp/goAPIv2.1"
# REPO_URL="https://github.com/Chileshe355/goAutoDialAPIv2.1.git"

# # Step 1: Backup the existing goAPIv2 directory
# echo "Backing up existing goAPIv2 directory..."
# if [ -d "$TARGET_DIR" ]; then
#     sudo mv "$TARGET_DIR" "$BACKUP_DIR"
#     echo "Backup completed: $BACKUP_DIR"
# else
#     echo "No existing goAPIv2 directory found. Skipping backup."
# fi

# # Step 2: Clone the repository into a temporary directory
# echo "Cloning repository from $REPO_URL..."
# git clone "$REPO_URL" "$TEMP_DIR"
# if [ $? -eq 0 ]; then
#     echo "Repository cloned to $TEMP_DIR"
# else
#     echo "Failed to clone repository. Exiting."
#     exit 1
# fi

# # Step 3: Move the cloned repository to the target directory
# echo "Replacing the goAPIv2 directory..."
# sudo mv "$TEMP_DIR" "$TARGET_DIR"
# echo "Replacement completed: $TARGET_DIR"

# # Step 4: Set permissions for the web server
# echo "Setting permissions for $TARGET_DIR..."
# sudo chmod -R 755 "$TARGET_DIR"
# sudo chown -R apache:apache "$TARGET_DIR"
# echo "Permissions set successfully."

# # Step 5: Clean up (optional, as TEMP_DIR is now moved)
# echo "Update process completed successfully!"

#!/bin/bash

# Variables
BACKUP_DIR="/var/www/html/goAPIv2_backup"
TARGET_DIR="/var/www/html/goAPIv2"
TEMP_DIR="/tmp/goAPIv2.1"
REPO_URL="https://github.com/Chileshe355/goAutoDialAPIv2.1.git"

# Step 1: Backup the existing goAPIv2 directory
echo "Backing up existing goAPIv2 directory..."
if [ -d "$TARGET_DIR" ]; then
    sudo mv "$TARGET_DIR" "$BACKUP_DIR"
    echo "Backup completed: $BACKUP_DIR"
else
    echo "No existing goAPIv2 directory found. Skipping backup."
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

# Step 3: Ensure no conflict with the existing goAPIv2 directory
echo "Cleaning up any leftover goAPIv2 directory..."
if [ -d "$TARGET_DIR" ]; then
    sudo rm -rf "$TARGET_DIR" # Remove if it exists
    echo "Removed leftover $TARGET_DIR"
fi

# Move the cloned repository to the target directory
echo "Replacing the goAPIv2 directory..."
sudo mv "$TEMP_DIR" "$TARGET_DIR"
echo "Replacement completed: $TARGET_DIR"

# Step 4: Set permissions for the web server
echo "Setting permissions for $TARGET_DIR..."
sudo chmod -R 755 "$TARGET_DIR"
sudo chown -R apache:apache "$TARGET_DIR"
echo "Permissions set successfully."

# Step 5: Clean up (optional, as TEMP_DIR is now moved)
echo "Update process completed successfully!"

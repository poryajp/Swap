#!/bin/bash

# ===============================
#  Swap File Creation Script
# ===============================

# Ask user for swap size in GB
read -p "Enter the swap size in GB: " SIZE_GB

# Calculate number of blocks (1 block = 1024 bytes)
COUNT=$((SIZE_GB * 1024 * 1024))

echo "Creating a swap file of size ${SIZE_GB}GB ..."

# Step 1: Create the swap file
sudo dd if=/dev/zero of=/swapfile bs=1024 count=$COUNT status=progress

# Step 2: Set correct permissions
sudo chmod 600 /swapfile

# Step 3: Format the file as swap space
sudo mkswap /swapfile

# Step 4: Enable the swap file
sudo swapon /swapfile

# Make swap permanent by adding it to /etc/fstab if not already present
if ! grep -q "^/swapfile" /etc/fstab; then
    echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab
fi

# Show current swap status
echo "Current active swap:"
sudo swapon --show

# Swap File Creation Script

This repository contains a simple Bash script to create, enable, and configure a swap file on Linux systems.  
The script automates the entire process — from creating the file to making it permanent across reboots.

---

## Features

- Prompts user for swap size in **GB**
- Creates a swap file at `/swapfile`
- Sets proper permissions (`600`)
- Formats the file as swap space
- Activates the swap immediately
- Makes swap persistent by adding an entry to `/etc/fstab`
- Displays current swap status

---

## Requirements

- A Linux system
- `sudo` privileges

---

## Usage

1. Clone this repository or download the script:
   ```bash
   git clone https://github.com/<your-username>/<your-repo-name>.git
   cd <your-repo-name>

#!/bin/sh
# ========================================
# Free Internet Main Installer
# Compatible with ash (BusyBox)
# ========================================


# ================================
# Variables
# ================================
FREE_INTERNET_INSTALL_DIR="/root/free-internet"
REPO_URL="https://github.com/saeedkefayati/free-internet.git"

# ================================
# Step 1: Clone or update repository
# ================================
if [ ! -d "$FREE_INTERNET_INSTALL_DIR" ]; then
    echo "[INFO] Cloning Free Internet repository to $FREE_INTERNET_INSTALL_DIR"
    git clone "$REPO_URL" "$FREE_INTERNET_INSTALL_DIR" || { echo "[ERROR] Failed to clone repo"; exit 1; }
else
    echo "[INFO] Updating Free Internet repository at $FREE_INTERNET_INSTALL_DIR"
    git -C "$FREE_INTERNET_INSTALL_DIR" reset --hard
    git -C "$FREE_INTERNET_INSTALL_DIR" clean -fd
    git -C "$FREE_INTERNET_INSTALL_DIR" pull || { echo "[ERROR] Failed to update repo"; exit 1; }
fi

# ================================
# Step 2: Grant execute permissions
# ================================
cd "$FREE_INTERNET_INSTALL_DIR" || exit
find "$FREE_INTERNET_INSTALL_DIR" -type f -name "*.sh" -exec chmod +x {} \;

# ================================
# Step 3: Run main.sh
# ================================
echo "[INFO] Launching Free Internet..."
./main.sh

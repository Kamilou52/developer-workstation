#!/usr/bin/env bash

set -euo pipefail

echo "===================================="
echo "Developer Workstation Update"
echo "===================================="

echo
echo "[1/4] Updating apt package index..."
sudo apt update

echo
echo "[2/4] Upgrading installed packages..."
sudo apt upgrade -y

echo
echo "[3/4] Cleaning unused packages..."
sudo apt autoremove -y

echo
echo "[4/4] Cleaning package cache..."
sudo apt autoclean

echo
echo "Update completed successfully."

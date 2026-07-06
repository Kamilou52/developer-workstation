#!/usr/bin/env bash

set -euo pipefail

echo "===================================="
echo "Restore Configuration"
echo "===================================="

echo
echo "Available backups:"
echo

ls backups

echo
read -rp "Enter the backup directory to restore: " BACKUP

BACKUP_DIR="backups/$BACKUP"

if [ ! -d "$BACKUP_DIR" ]; then
    echo
    echo "Backup not found."
    exit 1
fi

echo
echo "Creating a safety backup..."

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
SAFETY="backups/pre-restore-$TIMESTAMP"

mkdir -p "$SAFETY"

cp ~/.bashrc "$SAFETY/"
cp ~/.bash_aliases "$SAFETY/"
cp ~/.gitconfig "$SAFETY/"

if [ -f ~/.ssh/config ]; then
    cp ~/.ssh/config "$SAFETY/ssh_config"
fi

echo
echo "Restoring configuration..."

cp "$BACKUP_DIR/.bashrc" ~/.bashrc
cp "$BACKUP_DIR/.bash_aliases" ~/.bash_aliases
cp "$BACKUP_DIR/.gitconfig" ~/.gitconfig

if [ -f "$BACKUP_DIR/ssh_config" ]; then
    mkdir -p ~/.ssh
    cp "$BACKUP_DIR/ssh_config" ~/.ssh/config
fi

echo
echo "Configuration restored successfully."
echo
echo "Reload Bash with:"
echo
echo "source ~/.bashrc"

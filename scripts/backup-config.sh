#!/usr/bin/env bash

set -euo pipefail

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="backups/$TIMESTAMP"

mkdir -p "$BACKUP_DIR"

echo "Creating backup in $BACKUP_DIR"

cp ~/.bashrc "$BACKUP_DIR/"
cp ~/.bash_aliases "$BACKUP_DIR/"
cp ~/.gitconfig "$BACKUP_DIR/"

if [ -f ~/.ssh/config ]; then
    cp ~/.ssh/config "$BACKUP_DIR/ssh_config"
fi

echo "Backup completed successfully."

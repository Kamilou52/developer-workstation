#!/usr/bin/env bash

# @name: output.sh
# @description: Fonctions d'affichage formaté.
# @version: 1.3.0

# Shared output functions

print_title() {
    echo
    echo "========================================="
    echo "$1"
    echo "========================================="
}

print_info() {
    echo "[INFO] $1"
}

print_ok() {
    echo "[ OK ] $1"
}

print_warn() {
    echo "[WARN] $1"
}

print_error() {
    echo "[FAIL] $1"
}

#!/usr/bin/env bash

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

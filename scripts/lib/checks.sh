#!/usr/bin/env bash

# Shared validation functions

check_command() {
    local cmd="$1"
    local label="$2"

    print_title "$label"

    if command -v "$cmd" >/dev/null 2>&1
    then
        print_ok "$label installed"
        "$cmd" --version | head -1
    else
        print_warn "$label not installed"
    fi
}

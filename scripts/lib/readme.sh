#!/usr/bin/env bash

# =========================================
# README Library
# =========================================

get_version() {
    cat "$PROJECT_ROOT/VERSION"
}

get_script_count() {
    find "$PROJECT_ROOT/scripts" -maxdepth 1 -type f | wc -l
}

get_library_count() {
    find "$PROJECT_ROOT/scripts/lib" -maxdepth 1 -type f | wc -l
}

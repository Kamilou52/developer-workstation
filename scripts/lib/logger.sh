#!/usr/bin/env bash

LOG_DIR="$(dirname "$0")/../logs"
LOG_FILE="$LOG_DIR/doctor.log"

mkdir -p "$LOG_DIR"

log_info() {
    printf "[INFO] %s %s\n" "$(date '+%F %T')" "$1" >> "$LOG_FILE"
}

log_warn() {
    printf "[WARN] %s %s\n" "$(date '+%F %T')" "$1" >> "$LOG_FILE"
}

log_error() {
    printf "[FAIL] %s %s\n" "$(date '+%F %T')" "$1" >> "$LOG_FILE"
}



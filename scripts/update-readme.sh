#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$SCRIPT_DIR/lib/output.sh"
source "$SCRIPT_DIR/lib/readme.sh"

print_title "README Generator"

VERSION=$(get_version)

SCRIPT_COUNT=$(get_script_count)

LIB_COUNT=$(get_library_count)

print_info "Project : Developer Workstation"

print_info "Version : $VERSION"

print_info "Scripts : $SCRIPT_COUNT"

print_info "Libraries : $LIB_COUNT"

print_ok "Analysis completed"

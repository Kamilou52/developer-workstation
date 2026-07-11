#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/output.sh"

echo "========================================="
echo "Test Output Library"
echo "========================================="
echo

print_title "Test print_title()"

print_info "Information"

print_ok "Succès"

print_warn "Attention"

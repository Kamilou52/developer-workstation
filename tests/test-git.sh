#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/checks.sh"

print_title "Test de check_command git"

print_info "Test de check_command()"

echo
echo "Git :"
check_command git

print_ok "Tests terminés."

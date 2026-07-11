#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/checks.sh"

print_title "Test Checks Library"

print_info "Test de check_command()"

echo
echo "Git :"
check_command git

echo
echo "Node :"
check_command node

echo
echo "npm :"
check_command npm

echo
echo "GitHub CLI :"
check_command gh

echo
echo "Programme inexistant :"
check_command programme_inexistant || true

print_ok "Tests terminés."

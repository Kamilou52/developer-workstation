#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/test-framework.sh"
source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/tests.sh"
source "$PROJECT_ROOT/scripts/lib/assert.sh"
source "$PROJECT_ROOT/scripts/lib/filesystem.sh"

print_title "Filesystem Library"

assert_directory_exists \
    "$PROJECT_ROOT/scripts" \
    "scripts directory exists"

assert_directory_exists \
    "$PROJECT_ROOT/tests" \
    "tests directory exists"

assert_file_exists \
    "$PROJECT_ROOT/README.md" \
    "README exists"

assert_file_exists \
    "$PROJECT_ROOT/LICENSE" \
    "LICENSE exists"

#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/test-framework.sh"
source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/tests.sh"
source "$PROJECT_ROOT/scripts/lib/git.sh"
source "$PROJECT_ROOT/scripts/lib/assert.sh"

reset_test_counters

print_title "Test Assert Library"

###############################################################################
# assert_equals()
###############################################################################

print_title "assert_equals()"

assert_equals \
    "abc" \
    "abc" \
    "Equal strings"

echo

if ! assert_equals \
    "abc" \
    "xyz" \
    "Different strings"
then
    print_ok "assert_equals() detects difference"
fi

###############################################################################
# assert_file_exists()
###############################################################################

print_title "assert_file_exists()"

assert_file_exists \
    "$PROJECT_ROOT/scripts/new-project.sh" \
    "scripts/new-project.sh found"

echo

echo "Test 2 : fichier inexistant"

if ! assert_file_exists \
    "$PROJECT_ROOT/does-not-exist.txt" \
    "Missing file"
then
    print_ok "Missing file correctly detected"
fi

###############################################################################
# assert_directory_exists()
###############################################################################

echo
print_title "Test assert_directory_exists()"

echo "Test 1 : répertoire existant"

assert_directory_exists \
    "$PROJECT_ROOT/scripts" \
    "scripts directory found"

echo

echo "Test 2 : répertoire inexistant"

if ! assert_directory_exists \
    "$PROJECT_ROOT/scriptt" \
    "Directory exists"
then
    print_ok "Missing directory correctly detected"
fi

###############################################################################
# assert_contains()
###############################################################################

echo
print_title "Test assert_contains()"

assert_contains \
    "Developer" \
    "Developer Workstation" \
    "Developer found"

if ! assert_contains \
    "Linux" \
    "Developer Workstation" \
    "Linux not found"
then
    print_ok "Negative test passed"
fi

###############################################################################
# assert_file_contains()
###############################################################################

assert_file_contains \
    "$PROJECT_ROOT/README.md" \
    "# Developer Workstation" \
    "README contains project title"

echo

echo "Test 2 : README contains nonexistent string"

if ! assert_file_contains \
    "$PROJECT_ROOT/README.md" \
    "This string does not exist" \
    "README missing string"
then
    print_ok "Negative test passed"
fi

###############################################################################
# Résumé
###############################################################################

echo

print_info "Assertions : $(get_test_count)"
print_info "Succeeded  : $(get_passed_count)"
print_info "Failed     : $(get_failed_count)"

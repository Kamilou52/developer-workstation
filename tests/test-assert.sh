#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/test-framework.sh"
source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/tests.sh"
source "$PROJECT_ROOT/scripts/lib/assert.sh"

# --------------------------------------------------
# assert_equals()
# --------------------------------------------------

reset_test_counters

print_title "Test Assert Library"

if assert_equals "abc" "abc"
then
    print_ok "assert_equals() success"
else
    print_error "assert_equals() failed"
    exit 1
fi

if ! assert_equals "abc" "xyz"
then
    print_ok "assert_equals() detects difference"
else
    print_error "assert_equals() incorrect"
    exit 1
fi

print_title "assert_equals() with message"

if assert_equals "abc" "abc" "Equal strings"
then
    :
else
    exit 1
fi

# --------------------------------------------------
# assert_file_exists()
# --------------------------------------------------

echo
print_title "Test assert_file_exists()"

echo "Test 1 : fichier existant"

assert_file_exists \
    "$PROJECT_ROOT/scripts/new-project.sh" \
    "scripts/new-project.sh found" \
    "scripts/new-project.sh not found"
    exit 1


echo
echo "Test 2 : fichier inexistant"

if ! assert_file_exists "$PROJECT_ROOT/does-not-exist.txt"
then
    print_ok "Missing file correctly detected"
else
    print_error "Missing file incorrectly detected as existing"
    exit 1
fi

# --------------------------------------------------
# assert_directory_exists()
# --------------------------------------------------

echo
print_title "Test assert_directory_exists()"

echo "Test 1 : répertoire existant"

if assert_directory_exists "$PROJECT_ROOT/scripts"
then
    print_ok "scripts directory found"
else
    print_error "scripts directory not found"
    exit 1
fi

echo
echo "Test 2 : répertoire inexistant"

if ! assert_directory_exists "$PROJECT_ROOT/scriptt"
then
    print_ok "Missing directory correctly detected"
else
    print_error "Missing directory incorrectly detected as existing"
    exit 1
fi

# --------------------------------------------------
# assert_contains()
# --------------------------------------------------

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

# --------------------------------------------------
# assert_file_contains()
# --------------------------------------------------

echo

print_title "Test assert_file_contains()"

echo "Test 1 : README contains project title"

assert_file_contains \
    "$PROJECT_ROOT/README.md" \
    "Developer Workstation" \
    "README contains project title"

echo

echo "Test 2 : README contains nonexistent string"

if ! assert_file_contains \
    "$PROJECT_ROOT/README.md" \
    "This string does not exist" \
    "README missing string"
then
    print_ok "Negative test passed"
else
    exit 1
fi

echo
print_info "Assertions : $(get_test_count)"
print_info "Succeeded  : $(get_passed_count)"
print_info "Failed     : $(get_failed_count)"

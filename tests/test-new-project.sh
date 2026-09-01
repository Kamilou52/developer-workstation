#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/test-framework.sh"
source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/git.sh"
source "$PROJECT_ROOT/scripts/lib/tests.sh"
source "$PROJECT_ROOT/scripts/lib/assert.sh"
source "$PROJECT_ROOT/scripts/lib/filesystem.sh"

print_title "Test New Project Script"

###############################################################################
# initialize_repository()
###############################################################################

print_title "initialize_repository()"

TMP_PROJECT="$(mktemp -d)"

cleanup() {

    rm -rf "$TMP_PROJECT"

}

trap cleanup EXIT

create_file "$TMP_PROJECT/README.md"

assert_command_success \
    initialize_repository "$TMP_PROJECT" \
    "Repository initialized"

assert_equals \
    "main" \
    "$(git -C "$TMP_PROJECT" branch --show-current)" \
    "Main branch created"

assert_contains \
    "Initial project structure" \
    "$(git -C "$TMP_PROJECT" log -1 --pretty=format:"%s")" \
    "Initial commit created"

assert_command_success \
    git -C "$TMP_PROJECT" diff --quiet \
    "Working tree clean"

print_info "Assertions : $(get_test_count)"
print_info "Succeeded  : $(get_passed_count)"
print_info "Failed     : $(get_failed_count)"

#!/usr/bin/env bash

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/scripts/lib/test-framework.sh"

source "$PROJECT_ROOT/scripts/lib/git.sh"

print_title "Test Git Library"

BRANCH=$(get_current_branch)

assert_equals \
    "main" \
    "$BRANCH" \
    "Current branch"

assert_equals \
    "true" \
    "$(git rev-parse --is-inside-work-tree)" \
    "Inside Git repository"

REMOTE=$(get_remote_name)

assert_equals \
    "origin" \
    "$REMOTE" \
    "Git remote"

LAST_COMMIT=$(get_last_commit)

assert_contains \
    "-" \
    "$LAST_COMMIT" \
    "Last commit available"

assert_true \
    check_repository \
    "Inside Git repository"

assert_command_success \
    git rev-parse --is-inside-work-tree \
    "Git repository detected"

print_info "Assertions : $(get_test_count)"
print_info "Succeeded  : $(get_passed_count)"
print_info "Failed     : $(get_failed_count)"

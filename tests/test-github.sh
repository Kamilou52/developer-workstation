#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/test-framework.sh"
source "$PROJECT_ROOT/scripts/lib/github.sh"

print_title "Test GitHub Library"

###############################################################################
# check_github_auth()
###############################################################################

print_title "check_github_auth()"

assert_command_success \
    check_github_auth \
    "GitHub authentication check"

###############################################################################
# check_github_ssh()
###############################################################################

print_title "check_github_ssh()"

assert_command_success \
    check_github_ssh \
    "GitHub SSH check"

###############################################################################

print_info "Assertions : $(get_test_count)"
print_info "Succeeded  : $(get_passed_count)"
print_info "Failed     : $(get_failed_count)"

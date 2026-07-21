#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/assert.sh"

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

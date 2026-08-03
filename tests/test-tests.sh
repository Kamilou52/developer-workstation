#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/test-framework.sh"
source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/tests.sh"

print_title "Test Tests Library"

reset_test_counters

echo "Initial state"
echo "Total  : $(get_test_count)"
echo "Passed : $(get_passed_count)"
echo "Failed : $(get_failed_count)"

increment_total
increment_passed
increment_failed

echo
echo "After increments"

echo "Total  : $(get_test_count)"
echo "Passed : $(get_passed_count)"
echo "Failed : $(get_failed_count)"

if [ "$(get_test_count)" -eq 1 ] \
   && [ "$(get_passed_count)" -eq 1 ] \
   && [ "$(get_failed_count)" -eq 1 ]
then
    print_ok "Tests library works correctly."
else
    print_error "Unexpected counters."
    exit 1
fi

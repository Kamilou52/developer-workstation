#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/tests.sh"

echo "========================================="
echo "Test Tests Library"
echo "========================================="

reset_test_counters

echo "TOTAL  = $TOTAL"
echo "PASSED = $PASSED"
echo "FAILED = $FAILED"

increment_total
increment_passed

echo

echo "Après incrémentation"

echo "TOTAL  = $TOTAL"
echo "PASSED = $PASSED"
echo "FAILED = $FAILED"

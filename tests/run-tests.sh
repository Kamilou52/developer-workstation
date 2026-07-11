#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo
echo "========================================="
echo "Developer Workstation Test Suite"
echo "========================================="
echo

echo "Running test-readme.sh..."

"$PROJECT_ROOT/tests/test-readme.sh"

echo

echo "Running test-output.sh..."

"$PROJECT_ROOT/tests/test-output.sh"

echo

echo "Running test-checks.sh..."

"$PROJECT_ROOT/tests/test-checks.sh"

echo

echo "Running test-git.sh..."

"$PROJECT_ROOT/tests/test-git.sh"

echo

echo "========================================="
echo "All tests completed successfully."
echo "========================================="

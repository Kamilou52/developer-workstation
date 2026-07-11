#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/readme.sh"

echo "========================================="
echo "Test README Library"
echo "========================================="
echo

echo "Test 1 : description de doctor.sh"
get_metadata "$PROJECT_ROOT/scripts/doctor.sh" description

echo
echo "Test 2 : nom de doctor.sh"
get_metadata "$PROJECT_ROOT/scripts/doctor.sh" name

echo
echo "Test 3 : version de doctor.sh"
get_metadata "$PROJECT_ROOT/scripts/doctor.sh" version

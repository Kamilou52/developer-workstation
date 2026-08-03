#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/test-framework.sh"
source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/tests.sh"
source "$PROJECT_ROOT/scripts/lib/assert.sh"
source "$PROJECT_ROOT/scripts/lib/readme.sh"

DESCRIPTION=$(get_metadata \
    "$PROJECT_ROOT/scripts/doctor.sh" \
    description)

assert_equals \
    "Vérifie l'environnement de développement." \
    "$DESCRIPTION" \
    "doctor.sh description"

NAME=$(get_metadata \
    "$PROJECT_ROOT/scripts/doctor.sh" \
    name)

assert_equals \
    "doctor.sh" \
    "$NAME" \
    "doctor.sh name"

VERSION=$(get_metadata \
    "$PROJECT_ROOT/scripts/doctor.sh" \
    version)

assert_equals \
    "1.3.0" \
    "$VERSION" \
    "doctor.sh version"

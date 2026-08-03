#!/usr/bin/env bash

#
# @name: test-framework.sh
# @description: Common framework for all Developer Workstation tests.
# @version: 1.0.0
#

set -euo pipefail

#
# Prevent multiple loading
#

if [[ -n "${TEST_FRAMEWORK_LOADED:-}" ]]
then
    return 0
fi

readonly TEST_FRAMEWORK_LOADED=1

#
# Locate project root
#

TEST_FRAMEWORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PROJECT_ROOT="$(cd "$TEST_FRAMEWORK_DIR/../.." && pwd)"

readonly PROJECT_ROOT

#
# Load common libraries
#

source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/tests.sh"
source "$PROJECT_ROOT/scripts/lib/assert.sh"
source "$PROJECT_ROOT/scripts/lib/test-framework.sh"

#
# Initialize counters
#

initialize_test_framework() {

    reset_test_counters

}

initialize_test_framework

# reset_test_counters

#!/usr/bin/env bash

# @name: tests.sh
# @description: Fonctions communes pour l'exécution des tests.
# @version: 1.0.0

TOTAL=0
PASSED=0
FAILED=0

reset_test_counters() {

    TOTAL=0
    PASSED=0
    FAILED=0

}

increment_total() {

    ((++TOTAL))

}

increment_passed() {

    ((++PASSED))

}

discover_tests() {

    find "$PROJECT_ROOT/tests" \
        -maxdepth 1 \
        -type f \
        -name "test-*.sh" \
        | sort

}

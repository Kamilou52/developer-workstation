#!/usr/bin/env bash

# @name: tests.sh
# @description: Fonctions communes pour l'exécution des tests.
# @version: 1.0.0

TEST_TOTAL=0
TEST_PASSED=0
TEST_FAILED=0

get_test_count() {

    printf '%s\n' "$TEST_TOTAL"

}

get_passed_count() {

    printf '%s\n' "$TEST_PASSED"

}

get_failed_count() {

    printf '%s\n' "$TEST_FAILED"

}

TEST_TOTAL=0
TEST_PASSED=0
TEST_FAILED=0

reset_test_counters() {

    TEST_TOTAL=0
    TEST_PASSED=0
    TEST_FAILED=0

}

increment_total() {

    ((++TEST_TOTAL))

}

increment_passed() {

    ((++TEST_PASSED))

}

increment_failed() {

    ((++TEST_FAILED))

}

discover_tests() {

    find "$PROJECT_ROOT/tests" \
        -type f \
        -name "test-*.sh" \
        ! -path "*/dev/*" \
        | sort

}

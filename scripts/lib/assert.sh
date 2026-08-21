#!/usr/bin/env bash

#------------------------------------------------------------------------------
# Assert Library
# @name: assert.sh
# @description: Assertions communes pour les tests.
# @version: 2.1.0
#
# Toutes les assertions suivent la même convention.
#
# Signature :
#
#     assert_xxx arguments... "Message"
#
# Retour :
#
#     0 -> succès
#     1 -> échec
#
# Chaque assertion :
#
#     - met à jour les compteurs
#     - affiche le résultat
#     - retourne un code d'état
#
#------------------------------------------------------------------------------

###############################################################################
# Internal helpers
###############################################################################

ASSERT_SILENT=0

###############################################################################
# Internal predicates
###############################################################################

_equals() {

    local expected="$1"
    local actual="$2"

    [[ "$expected" == "$actual" ]]

}

_file_exists() {

    local file="$1"

    [[ -f "$file" ]]

}

_directory_exists() {

    local directory="$1"

    [[ -d "$directory" ]]

}

_contains() {

    local expected="$1"
    local actual="$2"

    [[ "$actual" == *"$expected"* ]]

}

_file_contains() {

    local file="$1"
    local expected="$2"

    [[ -f "$file" ]] && grep -Fq "$expected" "$file"

}

_command_succeeds() {

    "$@"

}

_command_fails() {

    "$@"

}

_assert_result() {

    local status="$1"
    local message="${2:-Assertion}"

    if [[ "${ASSERT_SILENT:-0}" == "1" ]]
    then
        return "$status"
    fi

    increment_total

    if (( status == 0 ))
    then
        increment_passed
        print_ok "$message"
    else
        increment_failed
        print_error "$message"
    fi

    return "$status"

}

_assert_failure_details() {

    if (( ${ASSERT_SILENT:-0} != 0 ))
    then
        return 0
    fi

    printf '%s\n' "$@"

}

#_assert_failure_details() {
#
#    while (( $# > 1 ))
#    do
#        printf '%-10s: %s\n' "$1" "$2"
#        shift 2
#    done
#
#}

#assert_empty() {
#
#    local value="$1"
#    local message="${2:-Value is empty}"
#
#    if [ -z "$value" ]
#    then
#        _assert_result 0 "$message"
#        return 0
#    fi
#
#    _assert_result 1 "$message"
#
#    _assert_failure_details \
#        "Value" "$value"
#
#    return 1
#
#}

#assert_not_empty() {
#
#    local value="$1"
#    local message="${2:-Value is not empty}"
#
#    if [ -n "$value" ]
#    then
#        _assert_result 0 "$message"
#        return 0
#    fi
#
#    _assert_result 1 "$message"
#
#    echo "Value is empty"
#
#    return 1
#
#}

###############################################################################
# Value assertions
###############################################################################

assert_equals() {

    local expected="$1"
    local actual="$2"
    local message="${3:-Assertion}"

    if _equals "$expected" "$actual"
    then
        _assert_result 0 "$message"
        return 0
    fi

    _assert_result 1 "$message"

    _assert_failure_details \
        "Expected : $expected" \
        "Actual   : $actual"

    return 1

}

assert_true() {

    local message="${2:-Assertion}"

    if _command_succeeds "$1"
    then
        _assert_result 0 "$message"
        return 0
    fi

    _assert_result 1 "$message"

    _assert_failure_details \
        "Command returned failure"

    return 1

}

assert_false() {

    local command="$1"
    local message="${2:-Assertion}"

    if _command_fails "$command"
    then
        _assert_result 1 "$message"
        _assert_failure_details \
            "Command unexpectedly succeeded"
        return 1
    fi

    _assert_result 0 "$message"
    return 0

}

###############################################################################
# Filesystem assertions
###############################################################################

assert_file_exists() {

    local file="$1"
    local message="${2:-File exists}"

    if _file_exists "$file"
    then
        _assert_result 0 "$message"
        return 0
    fi

    _assert_result 1 "$message"

    _assert_failure_details \
        "Missing file : $file"

    return 1

}

assert_directory_exists() {

    local directory="$1"
    local message="${2:-Directory exists}"

    if _directory_exists "$directory"
    then
        _assert_result 0 "$message"
        return 0
    fi

    _assert_result 1 "$message"

    _assert_failure_details \
        "Missing directory : $directory"

    return 1

}

assert_contains() {

    local expected="$1"
    local actual="$2"
    local message="${3:-Assertion}"

    if _contains "$expected" "$actual"
    then
        _assert_result 0 "$message"
        return 0
    fi

    _assert_result 1 "$message"

    _assert_failure_details \
        "Expected to find : $expected" \
        "In               : $actual"

    return 1

}

assert_file_contains() {

    local file="$1"
    local expected="$2"
    local message="${3:-Assertion}"

    if _file_contains "$file" "$expected"
    then
        _assert_result 0 "$message"
        return 0
    fi

    _assert_result 1 "$message"

    if [[ ! -f "$file" ]]
    then
        _assert_failure_details \
            "Missing file : $file"
    else
        _assert_failure_details \
            "Expected : $expected" \
            "File     : $file"
    fi

    return 1

}

###############################################################################
# Command assertions
###############################################################################

assert_command_success() {

    local message="${*: -1}"

    if (( $# > 1 ))
    then
        set -- "${@:1:$(($#-1))}"
    else
        message="Command succeeded"
    fi

    if _command_succeeds "$@"
    then
        _assert_result 0 "$message"
        return 0
    fi

    _assert_result 1 "$message"

    _assert_failure_details \
      "Command failed : $*"

    return 1

}

assert_command_failure() {

    local message="${*: -1}"

    if (( $# > 1 ))
    then
        set -- "${@:1:$(($#-1))}"
    else
        message="Command failed"
    fi

    if ! "$@"
    then
        _assert_result 0 "$message"
        return 0
    fi

    _assert_result 1 "$message"

    _assert_failure_details \
    "Command unexpectedly succeeded : $*"

    return 1

}

###############################################################################
# Test helpers
###############################################################################

expect_failure() {

    local previous_silent="${ASSERT_SILENT:-0}"
    local status

    ASSERT_SILENT=1

    set +e
    "$@"
    status=$?
    set -e

    ASSERT_SILENT="$previous_silent"

    if (( status != 0 ))
    then
        _assert_result 0 "Expected failure"
        return 0
    fi

    _assert_result 1 "Expected failure"

    _assert_result 1 "Expected failure"

    echo "Command unexpectedly succeeded : $*"

    return 1

}

# expect_failure() {
#
#    local message="${*: -1}"
#
#    if (( $# > 1 ))
#    then
#        set -- "${@:1:$(($#-1))}"
#    else
#        message="Expected failure"
#    fi
#
#    if "$@"
#    then
#        _assert_result 1 "$message"
#        echo "Command unexpectedly succeeded : $*"
#        return 1
#    fi
#
#    _assert_result 0 "$message"
#    return 0
#
#}

###############################################################################
# Text assertions 
###############################################################################

assert_contains() {

    local expected="$1"
    local actual="$2"
    local message="${3:-Assertion}"

    if [[ "$actual" == *"$expected"* ]]
    then
        _assert_result 0 "$message"
        return 0
    fi

    _assert_result 1 "$message"

    _assert_failure_details \
    "Expected : $expected" \
    "Actual   : $actual"

    return 1

}


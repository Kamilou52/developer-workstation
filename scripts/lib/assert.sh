#!/usr/bin/env bash

# @Name: assert.sh
# @Description: Assertions communes pour les tests.
# @Version: 1.0.0

_assert_result() {

    local status="$1"
    local message="${2:-}"

    if [ "$status" -eq 0 ]
    then
        [ -n "$message" ] && print_ok "$message"
    else
        [ -n "$message" ] && print_error "$message"
    fi

    return "$status"

}

assert_equals() {

    local expected="$1"
    local actual="$2"
    local message="${3:-}"

    if [ "$expected" = "$actual" ]
    then
        if [ -n "$message" ]
        then
            print_ok "$message"
        fi

        return 0
    fi

    if [ -n "$message" ]
    then
        print_error "$message"
        echo "Expected : $expected"
        echo "Actual   : $actual"
    fi

    return 1

}

assert_file_exists() {

    local file="$1"

    [ -f "$file" ]

}

assert_directory_exists() {

    local directory="$1"

    [ -d "$directory" ]

}

assert_command_success() {

    "$@"
    assert_command_success bash -n scripts/new-project.sh
    assert_command_success git --version

}

assert_command_failure() {

    if "$@"
    then
        return 1
    fi

    return 0

}

assert_contains() {

    local expected="$1"
    local actual="$2"
    local message="${3:-}"

    if [[ "$actual" == *"$expected"* ]]
    then
        _assert_result 0 "$message"
        return 0
    fi

    if [ -n "$message" ]
    then
        echo "Expected to find : $expected"
        echo "In               : $actual"
    fi

    _assert_result 1 "$message"

    echo "Expected : $expected"
    echo "Actual   : $actual"

    return 1

}

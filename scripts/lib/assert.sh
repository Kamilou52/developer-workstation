#!/usr/bin/env bash

# @Name: assert.sh
# @Description: Assertions communes pour les tests.
# @Version: 1.0.0

assert_equals() {

    local expected="$1"
    local actual="$2"

    if [ "$expected" = "$actual" ]
    then
        return 0
    fi

    return 1

}

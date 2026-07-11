#!/usr/bin/env bash

# =========================================
# README Library
#
# Public functions:
#   get_version
#   get_script_count
#   get_library_count
#   replace_section
#   update_version_section
#
# Dependencies:
#   PROJECT_ROOT
# =========================================

# --------------------------------------------------
# get_version
#
# Reads the VERSION file.
#
# Output:
#   version string
# --------------------------------------------------

get_version() {
    cat "$PROJECT_ROOT/VERSION"
}

# --------------------------------------------------
# get_version
#
# Reads the VERSION file.
#
# Output:
#   version string
# --------------------------------------------------

get_script_count() {
    find "$PROJECT_ROOT/scripts" -maxdepth 1 -type f | wc -l
}

# --------------------------------------------------
# get_version
#
# Reads the VERSION file.
#
# Output:
#   version string
# --------------------------------------------------

get_library_count() {
    find "$PROJECT_ROOT/scripts/lib" -maxdepth 1 -type f | wc -l
}

get_metadata() {

    local file="$1"
    local key="$2"

    awk -F': ' -v key="$key" '
        $1 == "# @" key {
            print $2
        }
    ' "$file"
}

replace_section() {

    local section="$1"
    local content="$2"

    awk \
        -v begin="<!-- BEGIN ${section} -->" \
        -v end="<!-- END ${section} -->" \
        -v replacement="$content" '

        $0==begin {

            print
            print replacement
            skip=1
            next

        }

        $0==end {

            skip=0
            print
            next

        }

        !skip {

            print

        }

    ' "$PROJECT_ROOT/README.md" \
    > "$PROJECT_ROOT/README.tmp"

    mv "$PROJECT_ROOT/README.tmp" "$PROJECT_ROOT/README.md"

}

update_version_section() {

    local version

    version=$(get_version)

    replace_section \
        "AUTO_VERSION" \
        "Version actuelle : **${version}**"

}

update_scripts_section() {

    local content

    content=$(
        find "$PROJECT_ROOT/scripts" \
            -maxdepth 1 \
            -type f \
            -printf "- %f\n" | sort
    )

    replace_section "AUTO_SCRIPTS" "$content"

}

update_libraries_section() {

    local content

    content=$(
        find "$PROJECT_ROOT/scripts/lib" \
            -maxdepth 1 \
            -type f \
            -printf "- %f\n" |
        sort
    )

    replace_section "AUTO_LIBRARIES" "$content"

}

#!/usr/bin/env bash

# @name: core.sh
# @description: Fonctions fondamentales du framework Developer Workstation.
# @version: 1.0.0

# --------------------------------------------------
# get_project_root
#
# Returns the absolute path of the project root.
#
# Output:
#   Project root path
# --------------------------------------------------

get_project_root() {

    local script_dir

    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

    printf '%s\n' "$script_dir"

}

get_scripts_dir() {

  local script_dir

  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

  printf '%s/scripts\n' "$(get_project_root)"

}

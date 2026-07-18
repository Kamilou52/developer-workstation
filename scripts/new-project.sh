#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/filesystem.sh"

print_title "New Project Generator"

ask_project_name() {

    read -rp "Project name: " PROJECT_NAME

}

create_project() {

    create_directory "$PROJECT_NAME"


    print_ok "Project directory created"

}

create_structure() {

    create_directory "$PROJECT_NAME/docs"

    create_directory "$PROJECT_NAME/src"

    create_directory "$PROJECT_NAME/tests"

    create_directory "$PROJECT_NAME/.github/workflows"

    print_ok "Project structure created"

}

create_files() {

    create_file "$PROJECT_NAME/README.md"
    create_file "$PROJECT_NAME/CHANGELOG.md"
    create_file "$PROJECT_NAME/LICENSE"
    create_file "$PROJECT_NAME/.gitignore"

    print_ok "Project files created"

}


initialize_git() {

    git -C "$PROJECT_NAME" init
    git -C "$PROJECT_NAME" branch -M main
    git -C "$PROJECT_NAME" add .
    git -C "$PROJECT_NAME" commit -m "Initial project structure"

}

main() {

    print_title "New Project Generator"

    ask_project_name

    create_project

    create_structure

    create_files

    initialize_git

    print_ok "Project successfully created"

    pwd

}

main

#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

OUTPUT_DIR="sandbox/projects"
PROJECT_DIR="."


source "$PROJECT_ROOT/scripts/lib/output.sh"
source "$PROJECT_ROOT/scripts/lib/filesystem.sh"
source "$PROJECT_ROOT/scripts/lib/git.sh"

print_title "New Project Generator"

ask_project_name() {

    read -rp "Project name: " PROJECT_NAME


}

create_project() {

    create_directory "$PROJECT_DIR"

    cd "$PROJECT_DIR"

    print_ok "Project directory created"

}

create_structure() {

    create_directory "$PROJECT_DIR/docs"

    create_directory "$PROJECT_DIR/src"

    create_directory "$PROJECT_DIR/tests"

    create_directory "$PROJECT_DIR/.github/workflows"

    print_ok "Project structure created"

}

create_files() {

    create_file "$PROJECT_DIR/README.md"
    create_file "$PROJECT_DIR/CHANGELOG.md"
    create_file "$PROJECT_DIR/LICENSE"
    create_file "$PROJECT_DIR/.gitignore"

    print_ok "Project files created"

}

main() {

    ask_project_name

    PROJECT_NAME="$OUTPUT_DIR/$PROJECT_DIR"

    create_project

    create_structure

    create_files

    initialize_repository "$PROJECT_DIR"

    print_ok "Project successfully created"

    pwd

}

main

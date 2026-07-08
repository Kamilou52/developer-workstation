#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$(dirname "$0")/lib/output.sh"

print_title "New Project Generator"

ask_project_name() {

    read -rp "Project name: " PROJECT_NAME

}

create_project() {

    mkdir -p "$PROJECT_NAME"

    cd "$PROJECT_NAME"

    print_ok "Project directory created"

}

create_structure() {

    mkdir docs

    mkdir src

    mkdir tests

    mkdir -p .github/workflows

    print_ok "Project structure created"

}

create_files() {

    cp "$SCRIPT_DIR/../templates/README.md.template" README.md

    cp "$SCRIPT_DIR/../templates/gitignore/default.gitignore" .gitignore

    touch CHANGELOG.md

    touch LICENSE

    print_ok "Project files created"

}


initialize_git() {

    git init

    git branch -M main

    git add .

    git commit -m "Initial project structure"

    print_ok "Git initialized"

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

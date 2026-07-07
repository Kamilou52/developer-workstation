#!/usr/bin/env bash

set -euo pipefail

echo "========================================="
echo "New Project Generator"
echo "========================================="

read -rp "Project name: " PROJECT

mkdir -p "$PROJECT"

cd "$PROJECT"

mkdir docs
mkdir src
mkdir tests

touch README.md
touch CHANGELOG.md
touch LICENSE
touch .gitignore

git init

echo "# $PROJECT" > README.md

echo
echo "Project created successfully."

pwd

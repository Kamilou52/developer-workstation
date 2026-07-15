#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/core.sh"

echo "========================================="
echo "Test Core Library"
echo "========================================="
echo

echo "Project root :"

get_project_root

echo "========================================="
echo "Test scripts dir"
echo "========================================="
echo

echo "The scipts dir :"

get_scripts_dir

echo "========================================="
echo "Test libraries scripts dir"
echo "========================================="
echo

echo "The libraries scipts dir :"

get_lib_dir

echo "========================================="
echo "Test Tests dir"
echo "========================================="
echo

echo "The tests dir :"



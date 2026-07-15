#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$PROJECT_ROOT/scripts/lib/filesystem.sh"

echo "========================================="
echo "Test Filesystem Library"
echo "========================================="
echo

echo "Répertoire scripts :"

if directory_exists "$PROJECT_ROOT/scripts"
then
    echo "OK"
else
    echo "ERREUR"
fi

echo

echo "README.md :"

if file_exists "$PROJECT_ROOT/README.md"
then
    echo "OK"
else
    echo "ERREUR"
fi


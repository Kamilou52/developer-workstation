#!/usr/bin/env bash

set -euo pipefail

echo "========================================="
echo "Developer Workstation Doctor"
echo "========================================="

echo
echo "User:"
whoami

echo
echo "Current directory:"
pwd

echo
echo "Operating System:"
uname -a

echo
echo "Git:"
git --version

echo
echo "GitHub CLI:"
gh --version

echo
echo "Node:"
node --version

echo
echo "npm:"
npm --version

echo
echo "VS Code:"
code --version | head -1

echo
echo "SSH:"
ssh -V

echo
echo "Git Status"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1
then
    git status
else
    echo "Not inside a Git repository."
fi

echo
echo "========================================="
echo "Diagnostics completed."

#!/usr/bin/env bash

set -euo pipefail

print_title() {
    echo
    echo "========================================="
    echo "$1"
    echo "========================================="
}

print_info() {
    echo "[INFO] $1"
}

print_ok() {
    echo "[ OK ] $1"
}

print_warn() {
    echo "[WARN] $1"
}

if command -v git >/dev/null 2>&1
then
    print_ok "Git installed"
    git --version
else
    print_warn "Git not installed"
fi

if command -v node >/dev/null 2>&1
then
    print_ok "Node.js installed"
    node --version
else
    print_warn "Node.js missing"
fi

if command -v npm >/dev/null 2>&1
then
    print_ok "npm installed"
    npm --version
else
    print_warn "npm missing"
fi

if command -v gh >/dev/null 2>&1
then
    print_ok "GitHub CLI installed"
    gh --version | head -1
else
    print_warn "GitHub CLI missing"
fi

print_title "SSH"

ssh -T git@github.com
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

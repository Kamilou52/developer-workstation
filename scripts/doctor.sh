#!/usr/bin/env bash

# @name: doctor.sh
# @description: Vérifie l'environnement de développement.
# @version: 1.3.0

set -euo pipefail

########################################
# Load shared libraries
########################################

source "$(dirname "$0")/lib/output.sh"
source "$(dirname "$0")/lib/checks.sh"
source "$(dirname "$0")/lib/git.sh"
source "$(dirname "$0")/lib/github.sh"
source "$(dirname "$0")/lib/logger.sh"

########################################
# Main program
########################################

#################################################
# Git diagnostics
#################################################
log_info "Doctor started"

check_repository
check_current_branch
check_remote
check_upstream
check_working_tree
check_last_commit
check_github_auth

log_info "Doctor finished"

#################################################
# Installed software
#################################################

check_command git "Git"
check_command node "Node.js"
check_command npm "npm"
check_command gh "GitHub CLI"

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

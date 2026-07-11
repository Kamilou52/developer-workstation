#!/usr/bin/env bash

# @name: bootstrap.sh
# @description: Initialise un poste de travail.
# @version: 1.3.0

####################################################
# Developer Workstation Bootstrap
# Version : 0.1
####################################################

echo "========================================="
echo " Developer Workstation Bootstrap"
echo "========================================="
echo

echo "Current user:"
whoami
echo

echo "Home directory:"
echo "$HOME"
echo

echo "Current directory:"
pwd
echo

echo "Operating system:"
uname -a
echo

echo "Git version:"
git --version
echo

echo "GitHub CLI:"
gh --version
echo

echo "Node.js:"
node --version
echo

echo "npm:"
npm --version
echo

echo "VS Code:"
code --version | head -n 1
echo

echo "Shell:"
echo "$SHELL"
echo

echo "Bootstrap finished."

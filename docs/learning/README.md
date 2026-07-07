# Developer Workstation

> Personal Linux Development Workstation for Full-Stack Development, DevOps, System Administration and Continuous Learning.

---

# Project Objectives

This repository contains my complete professional development environment.

The goal is to build a reproducible Linux workstation that can be installed on any computer in a few minutes while following professional DevOps practices.

This project also serves as my learning journal and portfolio.

---

# Current Project Structure

```text
developer-workstation/
│
├── backups/            # Configuration backups
├── config/             # Configuration templates
│   ├── bash/
│   ├── git/
│   └── ssh/
│
├── docs/
│   ├── bash/
│   ├── docker/
│   ├── git/
│   ├── github/
│   ├── learning/
│   ├── linux/
│   └── node/
│
├── scripts/
│   ├── bootstrap.sh
│   ├── update-dev.sh
│   └── backup-config.sh
│
├── templates/
├── tests/
└── README.md
```

---

# Development Roadmap

## Level 1 — Workstation Foundation

### Environment

* [x] Repository initialized
* [x] SSH authentication
* [x] Git configuration
* [x] GitHub configuration
* [x] Bash aliases
* [x] Development directory structure

---

### Scripts

* [x] bootstrap.sh
* [x] update-dev.sh
* [x] backup-config.sh
* [ ] restore-config.sh
* [ ] doctor.sh
* [ ] new-project.sh

---

### Documentation

* [x] Linux
* [x] Git
* [x] GitHub
* [x] Bash
* [x] Node.js

---

# Learning Method

Each feature follows the same workflow:

1. Design
2. Develop
3. Test
4. Document
5. Commit
6. Push
7. Improve

---

# Professional Rules

Before executing any Git command:

```bash
pwd
git status
git branch -vv
git remote -v
gh auth status
```

Never commit code that has not been tested.

Never modify configuration files without creating a backup.

Always work inside the correct project directory.

---

# Scripts

## bootstrap.sh

Initial workstation setup.

## update-dev.sh

Updates Ubuntu packages and cleans the system.

## backup-config.sh

Creates a timestamped backup of:

* ~/.bashrc
* ~/.bash_aliases
* ~/.gitconfig
* ~/.ssh/config

---

# Upcoming Features

* restore-config.sh
* doctor.sh
* new-project.sh
* install-dev-tools.sh
* docker-bootstrap.sh
* vscode-bootstrap.sh

---

# Future Improvements

* GitHub Actions
* CI/CD
* Automated testing
* Cross-platform support
* Docker support
* WSL support
* macOS compatibility
* Fedora compatibility

---

# Long-Term Goals

* Professional Linux workstation
* DevOps toolkit
* Bash scripting portfolio
* Infrastructure as Code
* Continuous Integration
* Continuous Deployment
* Technical documentation
* Automation library

---

# Author

Kamilou52

Learning by building.
Building by documenting.
Documenting by improving.

---
## Scripts

- [x] bootstrap.sh
- [x] update-dev.sh
- [x] backup-config.sh
- [x] restore-config.sh
- [ ] doctor.sh
- [ ] new-project.sh

## Scripts

- [x] bootstrap.sh
- [x] update-dev.sh
- [x] backup-config.sh
- [x] restore-config.sh
- [x] doctor.sh
- [x] new-project.sh

### Next scripts

- [ ] install-dev-tools.sh
- [ ] gitdoctor.sh
- [ ] vscode-bootstrap.sh
- [ ] docker-bootstrap.sh
- [ ] update-all.sh
Last update: July 2026


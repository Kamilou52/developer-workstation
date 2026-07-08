# Documentation Index

## Purpose

This directory contains all documentation related to the developer workstation.

## Structure

| Directory | Description                           |
| --------- | ------------------------------------- |
| bash      | Bash scripting and shell programming  |
| docker    | Docker notes and examples             |
| git       | Git learning notes and cheat sheets   |
| github    | GitHub and GitHub CLI documentation   |
| learning  | Learning journal and lessons learned  |
| linux     | Linux administration notes            |
| node      | Node.js and npm documentation         |
| scripts   | Documentation for workstation scripts |

## Scripts

Current scripts:

* bootstrap.sh
* update-dev.sh
* backup-config.sh
* restore-config.sh
* doctor.sh
* new-project.sh

Each script should have:

* Purpose
* Usage
* Examples
* Expected output
* Future improvements

## Project Architecture

The project is organized into reusable modules.

```
developer-workstation/
├── backups/
├── config/
├── docs/
├── scripts/
│   ├── backup-config.sh
│   ├── bootstrap.sh
│   ├── doctor.sh
│   ├── new-project.sh
│   ├── restore-config.sh
│   ├── update-dev.sh
│   └── lib/
│       ├── checks.sh
│       └── output.sh
├── templates/
└── tests/
```

### Library (`scripts/lib`)

The `scripts/lib` directory contains reusable Bash functions shared by multiple scripts.

Current modules:

* `output.sh` – display and formatting functions.
* `checks.sh` – generic validation and diagnostic functions.

This organization avoids code duplication and follows the DRY (Don't Repeat Yourself) principle.



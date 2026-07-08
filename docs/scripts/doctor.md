# doctor.sh

## Purpose

`doctor.sh` performs a complete health check of the development workstation.

It verifies that the essential development tools are installed and correctly configured before starting work on a project.

---

# Current checks

## Git

Checks that Git is installed.

Example:

```text
[ OK ] Git installed
git version 2.34.1
```

---

## Node.js

Checks that Node.js is available.

Example:

```text
[ OK ] Node.js installed
v24.15.0
```

---

## npm

Checks that npm is installed.

Example:

```text
[ OK ] npm installed
11.12.1
```

---

## GitHub CLI

Checks that GitHub CLI (`gh`) is installed.

Example:

```text
[ OK ] GitHub CLI installed
gh version 2.92.0
```

---

## SSH Authentication

Verifies the SSH connection to GitHub.

Expected result:

```text
Hi Kamilou52!
You've successfully authenticated,
but GitHub does not provide shell access.
```

This message confirms that the SSH authentication is working correctly.

---

# Usage

```bash
cd developper_workstation and apply
- ./scripts/doctor.sh
```

---

# Learning Objectives

This script introduces:

* Bash functions
* Conditional statements (`if`)
* Command detection (`command -v`)
* Basic system diagnostics
* GitHub SSH verification
* Automation best practices

---

# Planned Improvements

* Operating system information
* Bash version
* Git repository detection
* Current branch
* Git remote
* GitHub authentication status
* PATH verification
* VS Code detection
* Docker detection
* Python detection
* Java detection
* Health score
* Colored output
* Log file generation

---

# Status

Version: 2.0

State: Stable

## Internal Architecture

`doctor.sh` no longer contains all its functions.

Reusable functions are imported from:

* `scripts/lib/output.sh`
* `scripts/lib/checks.sh`

This makes the script smaller, easier to read and easier to maintain.

Future diagnostic modules will also be imported from `scripts/lib`.


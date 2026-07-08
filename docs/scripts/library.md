# Bash Library

## Purpose

The `scripts/lib` directory contains reusable Bash modules.

Instead of duplicating functions in every script, they are centralized and loaded using:

```bash
source "$(dirname "$0")/lib/output.sh"
source "$(dirname "$0")/lib/checks.sh"
```

---

## output.sh

Responsibilities:

* print_title()
* print_info()
* print_ok()
* print_warn()
* print_error()

This module standardizes script output.

---

## checks.sh

Responsibilities:

* check_command()

This module contains reusable validation functions.

---

## Benefits

* Less duplicated code
* Easier maintenance
* Better readability
* Easier testing
* Easier extension

---

## Design Principle

One responsibility per module.

Each module should focus on a single concern.


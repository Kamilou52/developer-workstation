# Bash Functions

## Purpose

Functions allow code to be written once and reused many times.

They improve:

* readability
* maintainability
* modularity
* code reuse

---

# Example: check_command()

```bash
check_command() {
    local cmd="$1"
    local label="$2"

    print_title "$label"

    if command -v "$cmd" >/dev/null 2>&1
    then
        print_ok "$label installed"
        "$cmd" --version | head -1
    else
        print_warn "$label not installed"
    fi
}
```

---

## Parameters

| Parameter | Description          |
| --------- | -------------------- |
| `$1`      | Command to execute   |
| `$2`      | Human-readable label |

Example:

```bash
check_command git "Git"
```

becomes internally:

```bash
command -v git
git --version
```

---

## Advantages

Without a function, the same `if ... then ... else` block must be repeated for every command.

With a function:

```bash
check_command git "Git"
check_command node "Node.js"
check_command npm "npm"
check_command gh "GitHub CLI"
```

The code is shorter, easier to maintain and follows the DRY (Don't Repeat Yourself) principle.


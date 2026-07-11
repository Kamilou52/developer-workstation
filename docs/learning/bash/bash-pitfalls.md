# Bash Pitfalls

## Post-increment with `set -e`

Avoid:

```bash
((TOTAL++))

With set -e, this returns exit code 1 when TOTAL is initially 0, causing the script to stop.

Prefer: ((++TOTAL)) or TOTAL=$((TOTAL + 1)).

Reason:

((TOTAL++)) evaluates the old value first.
((++TOTAL)) evaluates the new value.


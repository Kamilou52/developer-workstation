# Git Status Decoder

This document explains the most common `git status` messages.

---

## Changes to be committed

Meaning:

The files are staged and ready to be committed.

Action:

```bash
git commit -m "Describe your changes"
```

---

## Changes not staged for commit

Meaning:

Git detected modified files, but they have not been added to the staging area.

Action:

```bash
git add <file>
```

or

```bash
git add .
```

---

## Untracked files

Meaning:

Git has found new files that are not yet tracked.

Action:

```bash
git add <file>
```

---

## Nothing to commit, working tree clean

Meaning:

Everything is committed.

Action:

Continue working.

---

## fatal: not a git repository

Meaning:

You are not inside a Git repository.

Checklist:

1. Check your location

```bash
pwd
```

2. Check if `.git` exists

```bash
ls -la
```

3. If this is a new project

```bash
git init
```

Otherwise, move to the correct project directory.

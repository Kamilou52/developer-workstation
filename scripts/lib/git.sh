#!/usr/bin/env bash

# Git helper functions

check_repository() {

    print_title "Git Repository"

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
    then
        print_ok "Git repository detected"
    else
        print_error "Not inside a Git repository"
        return 1
    fi

}

check_current_branch() {

    local branch

    branch=$(git branch --show-current)

    print_ok "Current branch : $branch"

}

check_remote() {

    local remote

    remote=$(git remote)

    if [ -n "$remote" ]
    then
        print_ok "Remote : $remote"
    else
        print_warn "No remote configured"
    fi

}

check_working_tree() {

    if git diff --quiet && git diff --cached --quiet
    then
        print_ok "Working tree clean"
    else
        print_warn "Uncommitted changes detected"
    fi

}

check_last_commit() {

    local commit

    commit=$(git log -1 --pretty=format:"%h - %s")

    print_ok "Last commit : $commit"

}

check_upstream() {

    local upstream

    upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || true)

    if [ -n "$upstream" ]
    then
        print_ok "Tracking : $upstream"
    else
        print_warn "No upstream configured"
    fi

}




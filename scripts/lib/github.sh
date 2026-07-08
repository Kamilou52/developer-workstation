#!/usr/bin/env bash

check_github_auth() {

    print_title "GitHub"

    if gh auth status >/dev/null 2>&1
    then
        print_ok "GitHub CLI authenticated"
    else
        print_warn "GitHub CLI not authenticated"
    fi

}

check_github_ssh() {

    if ssh -T git@github.com >/dev/null 2>&1
    then
        print_ok "GitHub SSH authentication"
    else
        print_warn "GitHub SSH authentication failed"
    fi

}


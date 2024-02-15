#!/bin/bash

: "${FORCE:?'missing FORCE envar'}"

log() { printf "[$(date +%T)] %s\n" "$*"; }
log_err() { log "[ERROR]" "$*"; }

path_exists() {
    # return 0 (true) if path exists, otherwise 1 (false)
    # usage: if path_exists "/test"; then ...
    if [[ -e "${path}" ]]; then
        return 0
    else
        return 1
    fi
}

prompt_yes() {
    while true; do
        read -r -p "Are you sure [Y/N]?" yn
        case $yn in
            [Yy]* ) return 0;; # true
            [Nn]* ) return 1;; # false
            * ) log "Answer yes/no" ;;
        esac
    done
}

is_yes() {
    if [[ "${1}" != "yes" ]]; then
        return 1
    fi
    return 0
}

forced() {
    return $(is_yes "${FORCE}")
}

fail_if_not_found() {
    local path="${1:?'missing path'}"
    if ! path_exists "${path}"; then
        log_err "Path (${path}) does not exist"
        exit 1
    fi
}

prompt_if_exists() {
    local path="${1:?'missin path'}"
    if ! path_exists "${path}"; then
        return 0
    fi
    log "Path ${path} already exists"
    if forced || prompt_yes; then
        return 0
    fi
    log "Action aborted"
    return 1
}

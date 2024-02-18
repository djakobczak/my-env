#!/bin/bash

MY_RC_FILE=".my-rc"
MY_RC_PATH="${HOME}/${MY_RC_FILE}"

log "Creating ${MY_RC_PATH}"

cat << EOF > "${MY_RC_PATH}"
# git
source /usr/share/bash-completion/completions/git
alias g=git
__git_complete g __git_main

# starship
eval "\$(starship init bash)"

# ble.sh
source ~/.local/share/blesh/ble.sh

export PATH="\${PATH}:\${HOME}/.local/bin"

# common functions
log() { printf "[$(date +%T)] %s\n" "\$*"; }
log_err() { log "[ERROR]" "\$*"; }

EOF

if ! grep -qF ". ~/${MY_RC_FILE}" "${HOME}/.bashrc"; then
    log "Updating .bashrc"
    echo ". ~/${MY_RC_FILE}" >> "${HOME}/.bashrc"
fi

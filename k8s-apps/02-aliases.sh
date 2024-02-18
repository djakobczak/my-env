#!/bin/bash

MY_RC_FILE=".my-rc-k8s"
MY_RC_PATH="${HOME}/${MY_RC_FILE}"

cat << EOF > "${MY_RC_PATH}"
source <(kubectl completion bash)

alias k=kubectl
complete -F __start_kubectl k
EOF

if ! grep -qF ". ~/${MY_RC_FILE}" "${HOME}/.bashrc"; then
    log "Updating .bashrc"
    echo ". ~/${MY_RC_FILE}" >> "${HOME}/.bashrc"
fi

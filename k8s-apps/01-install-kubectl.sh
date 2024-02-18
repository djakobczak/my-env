#!/bin/bash

. .env

if [[ -z "${KUBECTL_VERSION}" ]]; then
    log "KUBECTL_VERSION not set using latest stable"
    KUBECTL_VERSION="$(curl -L -s https://dl.k8s.io/release/stable.txt)"
fi

curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

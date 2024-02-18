#!/bin/bash
set -e

# https://github.com/dandavison/delta/issues/504
# cannot install on Ubuntu <19
. /etc/os-release
if [[ "${NAME,,}" == "ubuntu" ]] && [[ "${VERSION_ID}" =~ ^1[0-8].+ ]]; then
    log_err "Cannot install git-delta on Ubuntu < 19"
    exit 1
fi

wget https://github.com/dandavison/delta/releases/download/0.11.3/git-delta_0.11.3_amd64.deb
sudo apt install ./git-delta_0.11.3_amd64.deb
rm git-delta_0.11.3_amd64.deb

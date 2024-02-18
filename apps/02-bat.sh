#!/bin/bash

set -e

# https://github.com/sharkdp/bat
log "Installing bat"
sudo apt install bat -y
mkdir -p "${HOME}/.local/bin"
ln -s /usr/bin/batcat ~/.local/bin/bat 2> /dev/null
log "Installed"

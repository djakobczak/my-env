#!/bin/bash

set -e

log "Installing ble-sh"
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
log "Installed"
rm -rf ble.sh

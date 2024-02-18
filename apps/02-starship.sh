#!/bin/bash

set -e

log "Installing starship"
curl -sS https://starship.rs/install.sh -o install-sharship.sh
sh install-sharship.sh -y
rm install-sharship.sh
log "Installed"

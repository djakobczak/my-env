#!/bin/bash

set -e

if path_exists "${HOME}/src/gogh"; then
  log_warn "Skipping installing gogh, because ${HOME}/src/gogh already exists"
  exit 0
fi

log "Installing gogh"

# clone the repo into "$HOME/src/gogh"
mkdir -p "$HOME/src"
pushd "$HOME/src" || exit 1
git clone https://github.com/Gogh-Co/Gogh.git gogh
pushd gogh || exit 1

# necessary in the Gnome terminal on ubuntu
export TERMINAL=gnome-terminal

# Enter theme installs dir
cd installs || exit 1

# install themes
./atom.sh
./dracula.sh
./seti.sh

popd || exit 1
popd || exit 1
popd || exit 1

log "Installed"

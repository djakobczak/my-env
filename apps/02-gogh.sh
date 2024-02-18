#!/bin/bash

set -e

# BUG: cannot install with terminator ubuntu18

if [[ -n "${TERMINATOR_UUID}" ]]; then
  log_err "Cannot install gogh with terminator terminal"
  exit 1
fi

log "Installing gogh"

# clone the repo into "$HOME/src/gogh"
mkdir -p "$HOME/src"
pushd "$HOME/src" || exit 1

if ! path_exists "${HOME}/src/gogh"; then
  git clone https://github.com/Gogh-Co/Gogh.git gogh
fi

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

log "Installed"
exit 0

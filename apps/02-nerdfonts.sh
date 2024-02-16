#!/bin/bash

set -e

FONTS_DIR="${HOME}/.local/share/fonts"
FONT="DejaVuSansMono.zip"
FONT="RobotoMono.zip"

log "Installing ${FONT}"

mkdir -p "${FONTS_DIR}"
pushd "${FONTS_DIR}" || exit 1
log "Donwloading ${FONT}"
curl -Ss -L -O "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT}"
unzip "${FONT}"
log "Font unpacked"
rm *Windows* || true
rm "${FONT}"
popd || exit 1

fc-cache -fv
log "Font installed"

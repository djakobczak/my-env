#!/bin/bash

set -e

FONTS_DIR="${HOME}/.local/share/fonts"
FONT_NAME="DejaVuSansMono"
FONT_ZIP="${FONT_NAME}.zip"

if fc-list | grep -q "${FONT_NAME}"; then
    log "Log already installed, skipping..."
    exit 0
fi

log "Installing ${FONT_NAME}"

mkdir -p "${FONTS_DIR}"
pushd "${FONTS_DIR}" || exit 1
log "Donwloading ${FONT_ZIP}"
curl -Ss -L -O "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_ZIP}"
unzip "${FONT_ZIP}"
log "Font unpacked"
rm *Windows* || true
rm "${FONT_ZIP}"
popd || exit 1

fc-cache -fv
log "Font installed"

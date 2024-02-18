#!/bin/bash

# trap and sudo does not work

sudo apt update

pkgs=(
  curl
  fontconfig  # for nerd fonts
  git
  gawk  # ble-sh
  htop
  jq
  make
  nfs-common
  openssh-server
  openssl
  sed
  sshfs
  tmux
  vim
  wget
  xsel
)

FAILED=""
for pkg in "${pkgs[@]}"; do
  sudo apt install "${pkg}" -y || FAILED="yes"
done

[[ -n "${FAILED}" ]] && log "Failed to install pkgs" && exit 1
exit 0

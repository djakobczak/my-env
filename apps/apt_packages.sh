#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
    echo "Ctrl+C captured, stopping"
    exit 1
}

sudo apt update

pkgs=(
  curl
  git
  htop
  jq
  nfs-common
  openssh-server
  openssl
  sed
  sshfs
  vim
  wget
  xsel
)

FAILED=""
for i in "${!pkgs[@]}"; do
  sudo apt install "${pkgs[$i]}" -y || FAILED="yes"
done

[[ -n "${FAILED}" ]] && log_err "Failed to install: ${i}" && exit 1

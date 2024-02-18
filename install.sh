#!/bin/bash

set -u

# !TODO add to cmdl args
export FORCE="yes"

# source libs
set -a
. lib-common.sh
set +a

CONFIG_DIR="configs"
APPS_DIR="apps"

INSTALL_APPS="yes"
INSTALL_CONFIGS="yes"

# map between repo config and system path where config should be copied
declare -A CONFIGS
CONFIGS=(
  ["starship.toml"]="${HOME}/.config/starship.toml"
  [".gitconfig"]="${HOME}/.gitconfig"
  [".tmux.conf"]="${HOME}/.tmux.conf"
)

copy_configs() {
    fail_if_not_found "${CONFIG_DIR}"

    for local_config in "${!CONFIGS[@]}"; do
        local target_path="${CONFIGS[$local_config]}"
        local local_path="${CONFIG_DIR}/${local_config}"
        local target_dir
        fail_if_not_found "${local_path}"
        if ! prompt_if_exists "${target_path}"; then
            exit 1;
        fi

        target_dir="$(dirname "${target_path}")"
        mkdir -p "${target_dir}"
        log "Copying ${local_config} -> ${target_path}..."
        cp -f "${local_path}" "${target_path}"
    done
}

install_apps() {
    declare -a failed_scripts
    declare rc
    for install_script in "${APPS_DIR}"/*; do
      log "*************** Executing ${install_script} ***************"
      bash "${install_script}"; rc=$?
      if [[ "${rc}" != 0 ]]; then
        log_err "Failed to execute ${install_script}"
        failed_scripts+=("${install_script}")
      fi
      log "*************** Finished ${install_script} ***************"
    done

    if [[ "${#failed_scripts}" != 0 ]]; then
      err="Not all scripts installed correctly: ${failed_scripts[@]}"
      log_err "${err}"
      return 1
    fi
    return 0
}

if forced; then log "Using force"; fi

if is_yes "${INSTALL_APPS}"; then install_apps; else log "Skipping installing apps"; fi
if is_yes "${INSTALL_CONFIGS}"; then copy_configs; else log "Skipping copying configs"; fi

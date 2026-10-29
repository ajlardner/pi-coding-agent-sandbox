#!/bin/bash
PI_ENV_FILE=${PI_ENV_FILE:-$HOME/pi-sandbox/.env}
PI_WORKSPACE=${PI_WORKSPACE:-$PWD}
PI_CONFIG_DIR=${PI_CONFIG_DIR:-$HOME/.pi}

# TODO - dont let this be run in the same directory as the script
# TODO - cd to a specific directory and get rid of old files for a clean slate
# cd $HOME/agent-workspace
# mkdir -p $HOME/.archive/agent-workspace/"$(today)"

if [ "${1:-}" = "--update" ]; then
  shift
  script_dir=$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")
  podman build --pull=always --no-cache -f "$script_dir/ContainerFile" -t pi-coding-agent "$script_dir"
fi

podman run --rm -it --network host --env-file "$PI_ENV_FILE" -v $PI_WORKSPACE:/workspace -v $PI_CONFIG_DIR:/root/.pi pi-coding-agent

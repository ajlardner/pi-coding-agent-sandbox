#!/bin/bash
PROJECTS_DIR=${PROJECTS_DIR:-$HOME/projects}
PI_ENV_FILE=${PI_ENV_FILE:-$PROJECTS_DIR/pi-sandbox/.env}
PI_WORKSPACE=${PI_WORKSPACE:-$PWD}
PI_CONFIG_DIR=${PI_CONFIG_DIR:-$HOME/.pi}

# TODO - dont let this be run in the same directory as the script

podman run --rm -it --env-file "$PI_ENV_FILE" -v $PI_WORKSPACE:/workspace -v $PI_CONFIG_DIR:/root/.pi pi-coding-agent

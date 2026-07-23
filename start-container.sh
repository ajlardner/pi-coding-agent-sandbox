PI_ENV_FILE=${PI_ENV_FILE:-./.env}
PI_WORKSPACE=${PI_WORKSPACE:./workspace}
PI_CONFIG_DIR=${PI_CONFIG_DIR:-$HOME/.pi}

podman run --rm -it --env-file "$PI_ENV_FILE" -v $PI_WORKSPACE:/workspace -v $PI_CONFIG_DIR:/root/.pi pi-coding-agent

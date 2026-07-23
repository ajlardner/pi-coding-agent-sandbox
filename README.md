# Pi Coding Agent Configuration
Configuration, extensions / skills, and sandbox setup for Pi Coding Agent, run in rootless podman

## Dependencies
- podman

## Setup
```bash
# build the container from ContainerFile, call the ContainerFile and the container whatever you want
# if you change the container name from pi-coding-agent, change it in start-container.sh 
podman build -f ContainerFile -t pi-coding-agent
```

symlink `pi-coding-agent`, or whatever you want to call it, to your path: 

```i
# i have ~/bin on my path, if you dont, you can run `export PATH=$PATH:~/bin`, or add to .bashrc - `echo 'export PATH=$PATH:~/bin/' >> .bashrc`
# or put it wherever you want and add that to your path or dont the world is your oyster
ln -s ~/.pi/start-container.sh ~/bin/pi-coding-agent 
pi-coding-agent 
```
or directly call the script:
```
~/.pi/start-container.sh
```

## ENV variables
|variable|description|default value|
| - | - | - |
| PI_ENV_FILE | location of file to be passed to --env-file podman argument. defines the environment variables for the container. for example, OPENROUTER_API_KEY set in the PI_ENV_FILE will enable usage of all openrouter models available to your API key | [repo_root]/.env | 
| PI_WORKSPACE | root on your system that pi actually has access to. for example, if this is set to /, the container will see everything on your file system in the /workspace directory inside the container | |
| PI_CONFIG_DIR | maps to /root/.pi in the container, pi will use this as config files by default | $HOME/.pi |



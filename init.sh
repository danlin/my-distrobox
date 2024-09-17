#!/bin/bash

podman build -t ghcr.io/danlin/my-distrobox .
distrobox stop --yes my-distrobox
distrobox rm --force my-distrobox
SHELL=/usr/bin/zsh distrobox create -i ghcr.io/danlin/my-distrobox --init --name my-distrobox
distrobox enter my-distrobox -- ./setup.sh

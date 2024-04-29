build:
	podman build -t ghcr.io/danlin/my-distrobox .
clean:
	ditrobox rm my-distrobox
install:
	distrobox stop my-distrobox
	distrobox create -i ghcr.io/danlin/my-distrobox -c my-distrobox

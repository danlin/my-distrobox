FROM quay.io/toolbx/arch-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      name="my-toolbox" \
      version="0.6" \
      usage="This image is meant to be used with the distrobox command" \
      summary="Image to Setup Devices faster" \
      maintainer="Daniel Lindenfelser <daniel@lindenfelser.de>"

# Install extra packages
COPY extra-packages /
RUN yes | pacman -Syu --needed --noconfirm - < extra-packages
RUN rm /extra-packages

# Clean up cache
RUN yes | pacman -Scc

RUN   ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update


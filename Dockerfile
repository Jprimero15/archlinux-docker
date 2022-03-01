FROM archlinux:base-devel

USER root

ENV LANG=en_US.UTF-8
CMD ["/usr/bin/bash"]

# Print some info
CMD echo "ArchLinux Docker By Jprimero15"

# Install all required packages
COPY install_deps.sh /tmp/
RUN bash /tmp/install_deps.sh

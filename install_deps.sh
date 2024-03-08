#!/bin/bash

# Uncomment the community [multilib] repository
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Run pacman to update
pacman-key --init
pacman -Syyu --noconfirm

# Install basic packages
pacman -S --noconfirm \
                 wget nano kmod libelf pahole xmlto \
                 svn lzip git make patchelf zip \
                 inetutils base-devel neofetch ncurses \
                 clang bc ccache glibc z3 sudo \
                 bison cmake flex libelf cpio \
                 ninja openssl python3 dpkg unzip git-lfs \
                 aarch64-linux-gnu-gcc arm-none-eabi-binutils

# Fix pod2man missing error
export PATH=/usr/bin/core_perl:$PATH

# Create a symlink for z3
ln -s /usr/lib/libz3.so /usr/lib/libz3.so.4

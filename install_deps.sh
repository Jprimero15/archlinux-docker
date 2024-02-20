#!/bin/bash

# Uncomment the community [multilib] repository
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Run pacman to update
pacman-key --init
pacman -Syyu --noconfirm

# Install basic packages
pacman -S --noconfirm \
                 wget nano asp kmod libelf pahole xmlto \          
                 cmake svn lzip git make patchelf zip \
                 inetutils base-devel neofetch ncurses \
                 clang bc ccache multilib-devel glibc z3 \
                 sudo bison cmake flex libelf cpio \
                 ninja openssl python3 dpkg unzip \
                 aarch64-linux-gnu-gcc arm-none-eabi-binutils

# Fix pod2man missing error
export PATH=/usr/bin/core_perl:$PATH

# Create a symlink for z3
ln -s /usr/lib/libz3.so /usr/lib/libz3.so.4

# Setup locale
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
echo "LANG=en_US.UTF-8" | sudo tee -a /etc/locale.conf
sudo locale-gen en_US.UTF-8

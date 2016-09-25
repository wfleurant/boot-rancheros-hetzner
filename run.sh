#!/usr/bin/env bash

## Generates a password for the kernel cmdline
password=$( cat /dev/urandom| tr -dc a-zA-Z0-9 | fold -w 20 | head -n 1 )

echo "## Installing kexec-tools, aria2" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --show-progress kexec-tools aria2 && \
    apt-get clean

echo "## Downloading RancherOS ISO" && \
    aria2c https://github.com/rancher/os/releases/download/v0.6.1-rc2/rancheros.iso

echo "## CRC Checksum of rancheros.iso - v0.6.1-rc2" && \
    sha256sum rancheros.iso  | grep  \
        2ee7c0ad46fd7f61a45a81ff4c8c676cc3bc46a1a64cace88919e713a99ae613;
    [ $? -eq 0 ] && mount -t iso9660 rancheros.iso /mnt || echo bad iso image


echo "## Entering Mounted RancherOS ISO" && \
    [ -d /mnt/boot ] \
        && cd /mnt/ \
        || echo exit


echo "## Credentials: ${password}    (rancher)" && echo "##  Kernel-Executing RancherOS" && \
    kexec --initrd ./boot/initrd \
    --command-line="rancher.password=${password}" \
    ./boot/vmlinuz

#!/bin/bash
aptitude install -y git ca-certificates sudo debootstrap systemd-sysv; \
wget "https://raw.githubusercontent.com/docker/docker/master/contrib/mkimage-debootstrap.sh" -O \
   /usr/local/sbin/mkimage-debootstrap.sh && \
chmod +x /usr/local/sbin/mkimage-debootstrap.sh; \
mkimage-debootstrap.sh waja/debian jessie http://httpredir.debian.org/debian/ && \
git clone https://github.com/waja/docker-wowza.git ~/docker-wowza && \
cd ~/docker-wowza && \
git checkout waja && \
docker build --tag waja/wowza .

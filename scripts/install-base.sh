#!/bin/bash
# 
# Author    : Steve Michael
# Date      : 03 April 2025
# Purpose   : Install base tools and configuration
set -e 

mw-log "Installing enviroment variables..."
cp -v ../overlay/etc/enviroment /etc/

mw-log "Installing message of the day..."
cp -v ../overlay/etc/motd /etc/

mw-log "Installing base packages..."

apt install \
  build-essential \
  cmake \
  curl \
  gpg \
  imagemagick \
  jq \
  net-tools \
  openjdk-20-jdk \
  openssh-server \
  screen \
  socat \ 
  steghide \
  stow \
  xsel \
  tree \
  yad \
  -y

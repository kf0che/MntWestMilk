#!/bin/bash
# 
# Author    : Steve Michael
# Date      : 03 April 2025
# Purpose   : Install development tools
set -e

mw-log "Installing dev tools for building MWM packages and general development..."
apt install \
  git \
  libfuse2 \
  meld \
  rpm \
  vim \
  -y

mw-log "Installing tools for building custom ISO image..."
if ! command -v cubic
then 
  sudo apt-add-repository universe -y 
  sudo apt-add-repository ppa:cubic-wizard/release -y
  sudo apt update
  sudo apt install --no-install-recommends cubic -y
fi

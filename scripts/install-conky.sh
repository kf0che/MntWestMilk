#!/bin/bash
# 
# Author    : Steve Michael
# Date      : 03 April 2025
# Purpose   : Install Conky
set -e 

mw-log "Installing Conky..."
apt install \
  conky\
  -y

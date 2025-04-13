#!/bin/bash
#
# Author    : Steve Michael
# Date      : 03 April 2025
# Purpose   : Install light weight browser
#
# Postconditions:
# 1. Min browser installed

mw-log "Installing Min web browser..."

VERSION="1.34.1"
FILE="min-${VERSION]-amd64.deb"
URL="https://github.com/minbrowser/min/releases/download/v{VERSION}/${FILE}"

if [ ! -e $MW_DIST_DIR/$FILE ]; then
  mw-log "Downloading Min web browser: $URL"

  curl -s -L -O --fail $URL

  [ ! -e $MW_DIST_DIR ] && mkdir -v $MW_DIST_DIR

  mv -v $FILE $MW_DIST_DIR
else
  mw-log "${FILE} already downloaded. Skipping..."
fi

mw-log "Installing ${MW_DIST_DIR}/${FILE}..."
dpkg -i $MW_DIST_DIR/$FILE
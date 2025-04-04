#!/bin/bash
#
# Author  : Steve Michael
# Date    : 04 April 2025
# Purpose : Install AnyDesk
set -e

VERSION="6.4.3-1"
FILE=anydesk_${VERSION}_amd64.deb

mw-log "Installing AnyDesk ${VERSION}..."

TARGET_PATH="${MW_DIST_DIR}/${FILE}"

if [ ! -e ${TARGET_PATH} ]; then
  
  URL="https://anydesk.com/en/downloads/thank-you?dv=deb_64"

  mw-log "Downloading: ${URL}"
  curl -s -L -o ${FILE} -- fail ${URL}

  [ ! -e ${MW_DIST_DIR} } && mkdir ${MW_DIST_DIR}
  [ ! -e ${MW_SRC_DIR} && mkdir {$MW_SRC_DIR}

  mv -v ${FILE} ${MW_DIST_DIR}
fi 

mw-log "Installing: ${TARGET_PATH}"
dpkg -i ${TARGET_PATH}

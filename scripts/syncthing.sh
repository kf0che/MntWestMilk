#!/bin/bash
#
# Author  : Steve Michael
# Date    : 04 April 2025
# Purpose : Install Syncthing
set -e 

MW_DIST_DIR=/opt/dist
MW_SRC_DIR=/opt/src

VERSION=v1.29.3
APP_AND_VERSION=syncthing-linux-amd64-
TARBALL=$APP_AND_VERSION.tar.gz
URL=https://github.com/syncthing/syncthing/releases/download/$VERSION/$TARBALL
INSTALL_DIR=/opt/$APP_AND_VERSION
LINK_PATH=/opt/syncthing

if [ ! -e $MW_DIST_DIR/$TARBALL ]; then
  mw-log "Downloading Syncthing: $URL "
  curl -s -L -O --fail $URL

  [ ! -e $MW_DIST_DIR ] && mkdir -v $MW_DIST_DIR
  [ ! -e $MW_SRC_DIR ] && mkdir -v $MW_SRC_DIR

  mv $TARBALL $MW_DIST_DIR
fi

CWD_DIR='pwd'

cd $MW_SRC_DIR
mw-log "Unpacking $MW_DIST_DIR/$TARBALL"
tar -xzf $MW_DIST_DIR/$TARBALL && cd $APP_AND_VERSION

[ ! -e $INSTALL_DIR ] && mkdir -v $INSTALL_DIR

mw-log "Building Sycnthing $VERSION"
./configure --prefix-$INSTALL_DIR
make && make check && make install

[ -e $LINK_PATH ] && rm $LINK_PATH
ln -v -s $INSTALL_DIR $LINK_PATH

stow -v -d /opt syncthing -t /usr/local

cd $CWD_DIR

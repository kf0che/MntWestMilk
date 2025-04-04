#!/bin/bash
#
# Author  : Steve Michael
# Date    : 04 April 2025
# Purpose : Configure users and groups
set -e

MW_GID=1981

mw-log "Adding '${MW_GROUP}' group..."
groupadd -g ${MW_GID} ${MW_GROUP} 

mw-log "Configuring users..."

cp -r ../overlay/etc/skel /etc/
[ ! -e /etc/skel/Desktop ] && mkdir /etc/skel/Desktop

mw-log "Add all users to dialout group..."
cp -v -r ../overlay/etc/adduser.conf /etc/

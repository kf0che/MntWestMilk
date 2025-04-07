#!/bin/bash
#
# Author  : Steve Michael
# Date    : 04 April 2025
# Purpose : Install all scripts 

. ./env.sh
. ./functions.sh

exitIfNotRoot

./bootstrap.sh
./install-base.sh

./install-bash.sh
./install-dev-tools.sh
./install-min.sh
./install-branding.sh
./install-theme.sh
./import-bookmarks.sh

./configure-gnome.sh
./configure-user.sh 

./install-mwm-tools.sh

./install-conky.sh

./install-signal.sh
./anydesk.sh
./syncthing.sh
#!/bin/bash
#
# Author  : Steve Michael
# Date    : 04 April 2025
# Purpose : Install all scripts 

. ./env.sh
. ./functions.sh

exitIfNotRoot

./bootstrap.sh

./install-bash.sh
./install-dev-tools.sh
./install-browser.sh
./install-branding.sh

./configure-gnome.sh
./configure-user.sh 

./install-mwm-tools.sh

./install-conky.sh

./install-signal.sh

#!/bin/bash
# 
# Author   : Steve Michael
# Date     : 03 April 2025
# Purpose  : Install boot screen branding

mw-log "Installing Mtn West Milk branding"

apt install plymouth-themes -y

PLYMOUTH_DIR=/usr/share/plymouth
BOOT_LOGO=/usr/share/plymouth/ubuntu-logo.png
BOOT_LOGO_ORIG=$BOOT_LOGO.orig

if [ ! -e $BOOT_LOGO_ORIG ]; then
  cp $BOOT_LOGO $BOOT_LOGO_ORIG
  mw-log "Backing up boot screen logo: $BOOT_LOGO"
fi 

mw-log "Installing boot screen logo"
cp ../logos/MWM-logo.png $BOOT_LOGO

mw-log "Installing desktop wallpaper"
cp ../logos/MWW-wallpaper.png /usr/share/backgrounds
cp ../logos/MWM-wallpaper.png /usr/share/backgrounds/warty-final-cinnamon.png

gsettings set org.gnome.desktop.background picture-uri file:////usr/backgrounds/MWM-wallpaper.png

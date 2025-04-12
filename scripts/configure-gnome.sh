#!/bin/bash
# 
# Author    : Steve Michael
# Date      : 03 April 2025
# Purpose   : Configure GNOME

mw-log "Configuring GNOME"

cp ../overlay/usr/share/glib-2.0/schemas/cinnamon.gsettings-override \
  /usr/share/glib-2.0/schemas/

cp ../overlay/usr/share/icons/MW-icon.png \
  /usr/share/icons
chmod 644 /usr/share/icons/mw-*.png

glib-compile-schemas /usr/share/glib-2.0/schemas/

#!/bin/bash
#
# Author   : Steve Michael
# Date     : 03 April 2025
# Purpose  : Install Mountain West Milk applications

mw-log "Install MWM applications"

if [ ! -e $MW_HOME ]; then 
  mkdir -v -p $MW_HOME
fi

cp -v -r ../overlay/MW_HOME/* $MW_HOME

mw-log "Setting up permission for shared data access..."


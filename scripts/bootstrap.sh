#!/bin/bash
# 
# Author   : Steve Michael
# Date     : 03 April 2025
# Purpose  : Minimal bootstrap script for the installer

[ ! -d $MW_HOME/bin ] && mkdir -v -p $MW_HOME/bin

cp -v ../overlay/$MW_HOME/bin/mw-log $MW_HOME/bin
[ ! -e /usr/local/bin/mw-log ] && ln -v -s $MW_HOME/bin/mw-log /usr/local/bin/mw-log

mw-log "Starting Mountain West Milk Installation"

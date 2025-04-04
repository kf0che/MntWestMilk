#!/bin/bash
#
# Author  : Steve Michael
# Date    : 03 April 2025 
# Purpose : Global funtions
#
###########################################################################

function exitIfNotRoot() {
  if [ $EUID -ne 0 ]; then
    echo "Exiting. You must be root."
    echo "Try running: sudo ./$(basename $0)"
    exit -1
  fi
}

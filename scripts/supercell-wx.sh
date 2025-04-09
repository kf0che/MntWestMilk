#!/bin/bash

# Update package list and install dependencies
sudo apt update
sudo apt install -y build-essential git cmake libcurl4-openssl-dev

# Clone the Supercell-WX repository
git clone https://github.com/dpaulat/supercell-wx
cd supercell-wx

# Build the project
mkdir build
cd build
cmake ..
make

# Install the binary
sudo make install

# Verify installation
supercell-wx --version
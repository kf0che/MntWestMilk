#!/bin/bash

# Update package list and install prerequisites
sudo apt update
sudo apt install -y curl apt-transport-https gnupg

# Add Syncthing's official release PGP key
curl -s https://syncthing.net/release-key.txt | sudo gpg --dearmor -o /usr/share/keyrings/syncthing-archive-keyring.gpg

# Add Syncthing's stable repository
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update package list again and install Syncthing
sudo apt update
sudo apt install -y syncthing

# Enable and start Syncthing service
systemctl --user enable syncthing
systemctl --user start syncthing

echo "Syncthing installation completed. Access the web interface at http://localhost:8384"
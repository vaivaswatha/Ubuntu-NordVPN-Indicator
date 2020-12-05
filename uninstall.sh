#!/bin/bash

INSTALL_PATH=${HOME}/.local/opt/ubuntu-nordvpn-indicator/

echo "Removing Ubuntu NordVPN Indicator"
rm ~/.config/autostart/ubuntu-nordvpn-indicator.desktop
rm -rf $INSTALL_PATH

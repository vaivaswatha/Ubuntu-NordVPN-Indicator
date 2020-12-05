#!/bin/bash

INSTALL_PATH=${HOME}/.local/opt/ubuntu-nordvpn-indicator/

install_indicator()
{
    # Installing indicator in opt directory
    echo "Installing Ubuntu NordVPN Indicator"
    mkdir -p $INSTALL_PATH
    cp code/* $INSTALL_PATH

    # Installing autostart desktop file
    echo "Making sure the indicator starts at boot using autostart"
    mkdir -p $HOME/.config/autostart
    cp ubuntu-nordvpn-indicator.desktop $HOME/.config/autostart/
}

# Install client if not present
if ! command -v nordvpn > /dev/null 2>&1;
then
    echo "Please install nordvpn: https://nordvpn.com/download/linux/"
    exit 1
fi

# Install dependencies if not present
deps_available=$(dpkg -l | grep -E "gir1.2-appindicator-|python3-gi"  | wc --lines)
if [[ $deps_available -eq 2 ]]
then
    echo "Dependencies have been installed"
else
    echo "Please run sudo apt-get install -y gir1.2-appindicator python3-gi"
    exit 1
fi

# Install indicator
install_indicator

# Starting script
if pgrep -f "nordvpn_indicator" > /dev/null
then
    echo "Killing indicator"
    kill $(pgrep -f "nordvpn_indicator")
fi

echo "Starting indicator"
nohup $(command -v python3) ${INSTALL_PATH}/nordvpn_indicator.py >/dev/null 2>&1 &

echo "Finished"
